# php-pdf-benchmark

This repository is a fork of [articles-2-pdf-benchmark](https://github.com/Kyotu-Technology/kyotu/tree/main/articles/2-pdf-benchmark)

This repository contains the benchmark tests, results, and related files for comparing the performance of two PDF generation libraries: wkhtmltopdf and Puppeteer.

## Repository Structure

```bash
articles-2-pdf-benchmark
│
├── k6
│   ├── concurrent.js
│   ├── loadtests.sh
│   ├── sequential.js
│   └── stats.sh
│
├── Dockerfile-puppeteer
├── Dockerfile-wkhtmltopdf
├── puppeteer.js
├── puppeteer-package.json
├── wkhtmltopdf.js
└── wkhtmltopdf-package.json
```


### k6
This folder contains the k6 load test scripts and related files:

- `concurrent.js`: k6 load test script for concurrent requests.
- `loadtests.sh`: Shell script to run k6 load tests.
- `sequential.js`: k6 load test script for sequential requests.
- `stats.sh`: Shell script to gather Docker stats.

## Usage
To run the benchmark tests, follow these steps:

1. Build the Docker containers for Puppeteer and wkhtmltopdf using the respective Dockerfiles.

    ```shell
    cd php-dompdf
    docker build -t php-dompdf . --platform linux/amd64
    cd ../php-puppeteer
    docker build -t php-puppeteer . --platform linux/amd64
    cd ../php-wkhtmltopdf
    docker build -t php-wkhtmltopdf . --platform linux/amd64
    cd ..
    ```

2. Run the containers with PDF generation endpoints (`puppeteer.js` and `wkhtmltopdf.js`).
    
    ```shell
   docker run -dp 3000:80 --name php-dompdf php-dompdf
   docker run -dp 3001:80 --name php-puppeteer php-puppeteer
   docker run -dp 3002:80 --name php-wkhtmltopdf php-wkhtmltopdf
   ```
3. Gather the Docker stats using the `stats.sh` script.
   ```shell
   ./k6/stats.sh
   ```
4. Run the k6 load tests using the `loadtests.sh` script.
   ```shell
   ./k6/loadtests.sh
   ```
5. Analyze the results and compare the performance of both libraries.
6. cleanup
   ```shell
   docker stop php-dompdf php-puppeteer
   docker rm php-dompdf php-puppeteer
   rm docker_stats.txt
   ```

## Contributing
If you have suggestions, improvements, or other contributions, feel free to submit a pull request or open an issue.

## License
This project is licensed under the MIT License.
