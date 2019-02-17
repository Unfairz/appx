virsh domifaddr {{ item.name }} |  awk '{ print $4 }' | tail -n 2 | head -n 1 | cut -d "/" -f 1
