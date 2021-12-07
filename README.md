# DBMarlin-Docker Example

### Download Install
[dbmarlin.com/download](https://www.dbmarlin.com/download)

### Build
```sh
docker build -t db-marlin:latest .
````

### Run
```sh
docker run --rm -d -p 9090:9090 --name dbmarlin db-marlin
```

### Use
[DBMarlin-docker](http://localhost:9090)


### Other
```sh
docker run -it --rm -p 9090:9090 --name dbmarlin db-marlin bash
```


### Stop
```sh
docker stop dbmarlin
```