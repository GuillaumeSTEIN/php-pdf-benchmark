echo '' >> docker_stats.txt;
echo 'Running sequential tests' >> docker_stats.txt;
echo '------------------------' >> docker_stats.txt;

echo '' >> docker_stats.txt;
echo '    php-dompdf' >> docker_stats.txt;
docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3000 - <k6/sequential.js

echo '' >> docker_stats.txt;
echo '    php-puppeteer' >> docker_stats.txt;
docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3001 - <k6/sequential.js

echo '' >> docker_stats.txt;
echo 'Running concurrent tests' >> docker_stats.txt;
echo '------------------------' >> docker_stats.txt;

echo '' >> docker_stats.txt;
echo '    php-dompdf' >> docker_stats.txt;
docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3000 - <k6/concurrent.js

echo '' >> docker_stats.txt;
echo '    php-puppeteer' >> docker_stats.txt;
docker run --rm -i --network="host" grafana/k6 run -e URL=http://localhost:3001 - <k6/concurrent.js

echo '' >> docker_stats.txt;
echo '------------------------' >> docker_stats.txt;
echo 'End of tests' >> docker_stats.txt;
echo '------------------------' >> docker_stats.txt;
