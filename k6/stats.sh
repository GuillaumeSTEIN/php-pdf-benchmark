#bash

while true; do docker stats quizzical_kare elated_brown --no-stream | gawk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0 }' >> docker_stats.txt; sleep 1; done
