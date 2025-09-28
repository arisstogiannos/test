set -e

NAME="devops-kubernetes-api-service"
USERNAME="arisstogiannos"
IMAGE="$USERNAME/$NAME:latest"

echo "🚀 Starting deployment process..."
echo ""

echo "📦 Building Docker Image..."
echo ""
docker build -t $IMAGE .
echo ""
echo "✅ Docker image built successfully!"
echo ""

echo "⬆️  Pushing image to Docker Hub..."
echo ""
docker push $IMAGE
echo ""
echo "✅ Image pushed to Docker Hub successfully!"
echo ""

echo "☸️  Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
echo "✅ Kubernetes manifests applied successfully!"
echo ""

echo "🔍 Checking deployment status..."
echo ""
kubectl get pods
echo ""

echo "🌐 Checking services..."
echo ""
kubectl get services
echo ""

echo "📋 Getting main service details..."
echo ""
kubectl get service $NAME
echo ""

echo "🎉 Deployment completed successfully!"
echo "💡 Use 'minikube service $NAME' to access your application"