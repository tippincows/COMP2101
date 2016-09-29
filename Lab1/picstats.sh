#/!bin/bash
echo There are $(($(ls -l /home/lucas/bin/COMP2101-/Bash/Lab1/pictures/ | grep -v ^d | wc -l)-1)) Files in The Pictures Directory

echo Each file size is as follows
du -sh /home/lucas/bin/COMP2101-/Bash/Lab1/pictures/*

echo The 3 largest files are
ls -Slh /home/lucas/bin/COMP2101-/Bash/Lab1/pictures/*  | head -n 4

