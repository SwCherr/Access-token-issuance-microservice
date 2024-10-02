all: clean mocks

build:
	go build cmd/main.go

run:
	./main

test:
	go test --coverprofile=c.out ./pkg/handler/

gcov:
	go tool cover -html=c.out

clean: 
	rm -rf c.out
#	rm -rf mocks/


mocks: clean
	mockgen -source=pkg/service/service.go -destination=mocks/service/mock_service.go

dockerPostgres:
	docker pull postgres
	
# dockerDB:
# 	docker run --name=todo-db -e POSTGRES_PASSWORD='qwerty' -p 5436:5432 -d --rm postgres

# createFileMigration:
# 	migrate create -ext sql -dir ./schema -seq init
	
generateDB:
	migrate -path ./schema -database 'postgres://postgres:qwerty@localhost:5436/postgres?sslmode=disable' up

cleanDB:
	migrate -path ./schema -database 'postgres://postgres:qwerty@localhost:5436/postgres?sslmode=disable' down

.PHONY: clean