#bash

while true;
do
  docker stats php-dompdf php-puppeteer php-wkhtmltopdf --no-stream | gawk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0 }' >> docker_stats.txt;
  echo "" >> docker_stats.txt;
  sleep 1;
done
