echo "Criando as imagens....."

docker build -t luizplimaneto/projeto-backend:1.0 backend/.
docker build -t luizplimaneto/projeto-database:1.0 database/.

echo "Realizando push de imagens....."

docker push luizplimaneto/projeto-backend:1.0
docker push luizplimaneto/projeto-database:1.0

echo "Criando serviços no cluster kubernetes....."

kubectl apply -f ./services.yml

echo "Criando os deployments....."

kubectl apply -f ./deployments.yml

