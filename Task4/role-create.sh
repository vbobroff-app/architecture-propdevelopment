# Роль для просмотра ресурсов (cluster-viewer)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: cluster-viewer
rules:
- apiGroups: ["", "apps", "batch", "extensions"]
  resources: ["pods", "services", "deployments", "jobs", "configmaps"]
  verbs: ["get", "list", "watch"]
EOF

# Роль для редактирования ресурсов (cluster-editor)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: cluster-editor
rules:
- apiGroups: ["", "apps", "batch", "extensions"]
  resources: ["pods", "services", "deployments", "jobs", "configmaps"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
EOF

# Роль для администратора (cluster-admin)
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cluster-admin
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["*"]
EOF