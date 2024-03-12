#bash

while true;
do
  docker stats puppeteer wkhtmltopdf dompdf --no-stream | gawk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0 }' >> docker_stats.txt;
  echo "" >> docker_stats.txt;
  sleep 1;
done
