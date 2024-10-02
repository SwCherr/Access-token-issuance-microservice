# Microservice REST API

Микросервис по выдаче пары токенов доступа (Access, Refresh) по REST API. <br>
Программа разработана на языке программирования Go с использованием на основе открытого протокола JWT для работы с токенами авторизации.<br>
Покрытие тестами обеспечено на базе генерации моковых данных на основе библеотеки `mock`.<br>
Миграция базы данных на основе SQL скрипта с использованием утилиты `migrate`.<br>

API микросервиса имеет три маршрута: `/auth/signup`, `/auth/get`, `/auth/refresh`.<br>

## /auth/signup
Регистрация пользователя и занесение его в базу данных приложения. <br>
Требуемые данные: `email`, `password`.<br>

## /auth/get
Выдача новой пары токенов доступа пользователю и занесение сессии в базу данных приложения.<br>
Требуемые данные: `id`, `guid`, `refreshToken`.<br>

## /auth/refresh
Перевыпуск пары токенов пользователю и занесение новой сессии в базу данных приложения. В случае невалидных данных действующая сессии пользователя закрывается (удаляется) по указанному `guid`.<br>
Требуемые данные: `email`, `password`.<br>


## Installation
Для скрипта миграции базы данных необходима утилита `migrate` : `brew install golang-migrate`.<br>
Для запуска базы данных Postgres можно использовать образ `docker` : `docker pull postgres`.<br>

Для сборки с помощью Makefile необходим make: `brew install make`<br>
Сборка и запуск микросервиса осуществляется через команды `make build` и `make run` соответвенно.<br>

Запуск тестов: `make test`.<br>
Покрытие кода тестами: `make gcov`.<br>
Генерация моковых данных для тестирования: `make mocks`.<br>
Генерация базы данных: `make generateDB`.<br>


## Дальнейшее развитие проекта
Реализация флага `--config` для задания произвольного файла в качестве конфига.<br>
Упаковка приложения в docker-контейнер `(https://docs.docker.com/guides/language/golang/build-images/)`, создание инструкции по запуску.<br>
Создание CI-пайплайн для автосборки контейнеров.<br>
Создание манифеста docker-compose для запуска базы+приложения.<br>
