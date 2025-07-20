# mongodb docker setup guide

## 1. Create a keyfile

Generate a keyfile that will be used for authentication:

```bash
openssl rand -base64 756 > ./keyfile
```

## 2. Set permissions for the keyfile

Ensure the keyfile has the correct permissions and ownership:

```bash
chmod 600 ./keyfile
chown 999 ./keyfile
```

## 3. Create and start the Docker container

Finally, create and start the Docker container using docker-compose:

```bash
docker compose up -d
```

## 4. settings `/etc/hosts`

```sh
127.0.0.1 mongo-primary
127.0.0.1 mongo-secondary1
127.0.0.1 mongo-secondary2
127.0.0.1 mongo-arbiter
```
