#!/bin/bash
set -euo pipefail

# Deploy the backend service
ENV=${1:-staging}
IMAGE_TAG=${2:-latest}

echo "Deploying to ${ENV} with image tag ${IMAGE_TAG}"

docker build -t "reg.pantalasa.com/backend:${IMAGE_TAG}" .
docker push "reg.pantalasa.com/backend:${IMAGE_TAG}"

kubectl set image deployment/backend backend="reg.pantalasa.com/backend:${IMAGE_TAG}" -n ${ENV}
kubectl rollout status deployment/backend -n ${ENV} --timeout=300s

echo "Deploy complete"
