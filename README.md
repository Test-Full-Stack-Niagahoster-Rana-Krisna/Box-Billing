# Box-Billing

##Run APPS

```bash
docker-compose up --build -d
```

```bash
docker-compose -f docker-compose.yml -f docker-compose-with-landing.yml up --build -d
```

## Migrate DB
``` bash
docker container exec -i db mysql -u root -p12345 boxbilling < boxbilling.sql
```