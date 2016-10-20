#!/bin/bash

# display how many regular files there are in the Pictures directory
# and how much disk space they use. It should also show the sizes
# and names of the 3 largest files

echo -n "In the ~/Pictures directory, the number of files is "
find ~/Pictures -type f |wc -l

echo -n "Those files use "
du -h ~/Pictures |awk '{print $1}'

echo "The 3 largest files are:"
echo "========================"
du -h ~/Pictures/* |sort -h |tail -3
