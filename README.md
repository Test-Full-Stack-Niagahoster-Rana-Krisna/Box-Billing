# Niagahoster - Box Billing

## Prerequisite

* [Git](https://git-scm.com/)
* [Composer](https://getcomposer.org/)

## System Requirements

* Apache2
* Curl
* PHP >=7.4, with extensions :
	- ctype 
	- simplexml 
	- xml 
	- xmlwriter 
	- dom 
	- tokenizer 
	- phar 
	- apache2
	- common
	- curl
	- mbstring
	- mysqli
	- pdo_mysql
	- session
	- json
	- gettext
* MariaDB


## Installation

Clone repository.
```bash
git clone https://github.com/Test-Full-Stack-Niagahoster-Rana-Krisna/Box-Billing.git
```

```bash
cd Box-Billing
```


Gunakan package manager [composer](https://getcomposer.org/) untuk install
```bash
composer install
```

Buat file [.env] pada root folder
```bash
cp .env.example .env
```
lalu ubah content yg ada di **.env**
___

## Usage

## Running as Docker

Untuk menjalankan applikasi dalam bentuk docker, build __image__ dengan menggunakan
```
docker-compose build
```

Jalakan __image__ sebagai container dengan menggunakan
```
docker-compose up -d
```
akses di http://localhost:8004
___

## Running as Docker with Landing Page

untuk menjalankan aplikasi dengan Landing Page harap pastikan struktur folder sudah sesuai sepert tampilan dibawah ini.

- public_html
    - Landing-Page
    	- index.php
	    - **...**
    - Box-Billing
    	- index.php
	    - **...**


Untuk menjalankan applikasi dalam bentuk docker, build __image__ dengan menggunakan
```
docker-compose -f docker-compose.yml -f docker-compose-with-landing.yml build
```

Jalakan __image__ sebagai container dengan menggunakan
```
docker-compose -f docker-compose.yml -f docker-compose-with-landing.yml up -d
```

- akses box billing di http://localhost:8004

- akses landing page di http://localhost:8003


## Migrate DB
``` bash
docker container exec -i db mysql -u root -p12345 boxbilling < boxbilling.sql
```

>Konfigurasi Migrate DB, user pass dan database sesuaikan dengan yg ada di file **.env**