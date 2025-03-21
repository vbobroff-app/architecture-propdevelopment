#!/bin/bash

# Создание пользователя user-viewer
echo "Создание пользователя user-viewer..."
openssl genrsa -out user-viewer.key 2048
openssl req -new -key user-viewer.key -out user-viewer.csr -subj "/CN=user-viewer/O=group-viewer"
openssl x509 -req -in user-viewer.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out user-viewer.crt -days 365
kubectl config set-credentials user-viewer --client-certificate=user-viewer.crt --client-key=user-viewer.key
kubectl config set-context user-viewer-context --cluster=docker-desktop --user=user-viewer

# Создание пользователя user-editor
echo "Создание пользователя user-editor..."
openssl genrsa -out user-editor.key 2048
openssl req -new -key user-editor.key -out user-editor.csr -subj "/CN=user-editor/O=group-editor"
openssl x509 -req -in user-editor.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out user-editor.crt -days 365
kubectl config set-credentials user-editor --client-certificate=user-editor.crt --client-key=user-editor.key
kubectl config set-context user-editor-context --cluster=docker-desktop --user=user-editor

echo "Пользователи успешно созданы!"