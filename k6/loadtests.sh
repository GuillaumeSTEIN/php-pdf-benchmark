docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3001/generate-pdf-wkhtmltopdf - <k6/sequential.js
docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3001/generate-pdf-wkhtmltopdf - <k6/concurrent.js

docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3000/generate-pdf-puppeteer - <k6/sequential.js
docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3000/generate-pdf-puppeteer - <k6/concurrent.js

docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3002 - <k6/sequential.js
docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3002 - <k6/concurrent.js

