





```shell
# cart service
docker build -t carts-db ./carts-db
docker build -t carts ./carts
# catalogue service
docker build -t catalogue-db ./catalogue-db
docker build -t catalogue ./catalogue
# payment service
docker build -t payment ./payment
# rabbitmq
docker build -t rabbitmq ./rabbitmq
# shipping service
docker build -t shipping ./shipping
# order service
docker build -t orders-db ./orders-db
docker build -t orders ./orders
# user service
docker build -t users-db ./users-db
docker build -t users ./users
# front-end
docker build -t front-end ./front-end
```




```shell
# carts service
kubectl apply -f ./carts-db/carts-db-config.yaml -f ./carts-db/carts-db-deployment.yaml -f ./carts-db/carts-db-service.yaml
kubectl apply -f ./carts/carts-config.yaml -f ./carts/carts-deployment.yaml -f ./carts/carts-service.yaml
# catalogue service
kubectl apply -f ./catalogue-db/catalogue-db-config.yaml -f ./catalogue-db/catalogue-db-deployment.yaml -f ./catalogue-db/catalogue-db-service.yaml
kubectl apply -f ./catalogue/catalogue-config.yaml -f ./catalogue/catalogue-deployment.yaml -f ./catalogue/catalogue-service.yaml
# payment service
kubectl apply -f ./payment/payment-config.yaml -f ./payment/payment-deployment.yaml -f ./payment/payment-service.yaml
# rabbitmq
kubectl apply -f ./rabbitmq/rabbitmq-config.yaml -f ./rabbitmq/rabbitmq-deployment.yaml -f ./rabbitmq/rabbitmq-service.yaml
# shipping service
kubectl apply -f ./shipping/shipping-config.yaml -f ./shipping/shipping-deployment.yaml -f ./shipping/shipping-service.yaml
# order service
kubectl apply -f ./orders-db/orders-db-config.yaml -f ./orders-db/orders-db-deployment.yaml -f ./orders-db/orders-db-service.yaml
kubectl apply -f ./orders/orders-config.yaml -f ./orders/orders-deployment.yaml -f ./orders/orders-service.yaml
# user service
kubectl apply -f ./users-db/users-db-config.yaml -f ./users-db/users-db-deployment.yaml -f ./users-db/users-db-service.yaml
kubectl apply -f ./users/users-config.yaml -f ./users/users-deployment.yaml -f ./users/users-service.yaml
# front-end
kubectl apply -f ./front-end/front-end-config.yaml -f ./front-end/front-end-deployment.yaml -f ./front-end/front-end-service.yaml
```
