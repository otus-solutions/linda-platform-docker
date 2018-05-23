# Docker Plataform
## Dependencias
 - docker
 - docker-compose

 ## Passos para iniciar os containers
 Primeiramente, entre na pasta otus-plataform-compose pelo terminal.

 Execute o comando:
 > sudo docker-compose up -d

 ### Usuário do WildFly
 Para adicionar o usuário de deploy no container do wildfly, execute este comando:
 > sudo docker exec -ti wildfly_server /opt/jboss/wildfly/bin/add-user.sh admin rBQqsMXU --silent

## Deploy
- API
Execute o build informando o database.host=mongodb_server e após execute o deploy normalmente.

- Front-end
> sudo docker cp otus/. nginx_server:/usr/share/nginx/html/
