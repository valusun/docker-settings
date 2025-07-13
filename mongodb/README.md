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
