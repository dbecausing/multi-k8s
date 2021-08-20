docker build -t dbecausing/multi-client:latest -t dbecausing/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t dbecausing/multi-server:latest -t dbecausing/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t dbecausing/multi-worker:latest -t dbecausing/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push dbecausing/multi-client:latest
docker push dbecausing/multi-server:latest
docker push dbecausing/multi-worker:latest

docker push dbecausing/multi-client:$SHA
docker push dbecausing/multi-server:$SHA
docker push dbecausing/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment dbecausing/multi-client:$SHA
kubectl set image deployments/server-deployment dbecausing/multi-server:$SHA
kubectl set image deployments/worker-deployment dbecausing/multi-worker:$SHA