all: clean mocks

build:
	go build cmd/main.go

run: clean build
	./main

mocks: clean
	mockgen -source=pkg/service/service.go -destination=mocks/service/mock_service.go
#	mockgen -source=pkg/repository/repository.go -destination=mocks/repository/mock_repository.go

test: mocks
	go test --coverprofile=c.out ./pkg/handler/

gcov: test
	go tool cover -html=c.out

clean: 
#	rm -rf mocks/
	rm -rf c.out

createFileMigration:
	migrate create -ext sql -dir ./schema -seq init
	
generateDB:
	migrate -path ./schema -database 'postgres://postgres:qwerty@localhost:5436/postgres?sslmode=disable' up

cleanDB:
	migrate -path ./schema -database 'postgres://postgres:qwerty@localhost:5436/postgres?sslmode=disable' down

.PHONY: clean
 
# -source определяет исходный файл, из которого будет сгенерирован mock-объект.
# -destination определяет файл, в который будет записан сгенерированный mock-объект.
# -package определяет имя пакета, в котором будет находиться сгенерированный mock-объект.