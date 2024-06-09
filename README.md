# portfolio
# Clean Up

```
To stop and delete all containers
docker rm -f $(docker ps -aq)
Delete all images
docker rmi -f $(docker images -aq)
docker system prune -a
```
# issue with compose when changing redis and db password

```
stop compose: docker-compose down
delete all volumes: docker volume ls & docker volume rm weatherapp-db-data
start compose
this is because the password was already persisted

```

## login and check users that sign up already as root
```
docker exec -it [container-ID/NAME] bash
mysql -u root -p

SHOW DATABASES;
USE auth;
SHOW tables;
SELECT * FROM users:

## login as user weatherapp from mysql-database we created in the db service file
USE weatherapp;
SHOW tables; result will be empty
now exit db ans sign in as user:weatherapp

mysql -u weatherapp -p 
SHOW DATABASES;
## at this point we only see weatherapp table and nothing else since weatherapp is not root user and does not have access to all tables
exit db

## to grant mysql user "weatherapp" full or admin access to all databases follow:
mysql -u root -p

GRANT ALL PRIVILEGES ON *.* TO 'weatherapp'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
exit

login as user "weatherapp" again
SHOW DATABASES;
you'll now see all databases listed


in this case:
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'host' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;

exit


## GitHub hook trigger for GITScm polling:
```groovy
pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Build') {
            steps {
                // Your build steps go here
            }
        }
    }
}
```

## Poll SCM:
```groovy
pipeline {
    agent any

    triggers {
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Build') {
            steps {
                // Your build steps go here
            }
        }
    }
}
```

## Build periodically:
```groovy
pipeline {
    agent any

    triggers {
        cron('0 0 * * *')
    }

    stages {
        stage('Build') {
            steps {
                // Your build steps go here
            }
        }
    }
}
```