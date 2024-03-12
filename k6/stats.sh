#bash

while true;
do
  docker stats js-puppeteer js-wkhtmltopdf php-dompdf --no-stream | gawk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0 }' >> docker_stats.txt;
  echo "" >> docker_stats.txt;
  sleep 1;
done
