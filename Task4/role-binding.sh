# Привязка роли cluster-viewer к пользователю user-viewer
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: user-viewer-binding
  namespace: default
subjects:
- kind: User
  name: user-viewer
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: cluster-viewer
  apiGroup: rbac.authorization.k8s.io
EOF

# Привязка роли cluster-editor к пользователю user-editor
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: user-editor-binding
  namespace: default
subjects:
- kind: User
  name: user-editor
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: cluster-editor
  apiGroup: rbac.authorization.k8s.io
EOF

# Привязка роли cluster-admin к группе администраторов
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cluster-admin-binding
subjects:
- kind: Group
  name: system:masters
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
EOF