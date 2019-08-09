echo 'Deploy Started!'
cd $PWD/api/
docker exec api.relire.express_app php artisan down
git pull origin master
docker exec api.relire.express_app composer install --no-dev --prefer-dist
docker exec api.relire.express_app php artisan cache:clear
docker exec api.relire.express_app php artisan config:cache
docker exec api.relire.express_app php artisan route:cache
docker exec api.relire.express_app php artisan migrate
docker exec api.relire.express_app php artisan up
echo 'Deploy Finished.'
