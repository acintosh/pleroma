
#./clean.sh
git clone https://git.pleroma.social/pleroma/pleroma.git
\cp -rf pleroma/config .
\cp -rf pleroma/priv .
sudo docker-compose -f ./docker-compose-setup.sh build
sudo docker-compose -f ./docker-compose-setup.sh run --rm app mix generate_config
\cp -f config/generated_config.exs config/prod.secret.exs
nvim config/prod.secret.exs docker-compose.yml
sudo docker-compose run --rm app mix ecto.migrate
