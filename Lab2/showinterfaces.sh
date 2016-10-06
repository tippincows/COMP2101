#!/bin/bash


gw=`route -n | grep '^0.0.0.0' | awk '{print $2}'`


echo $gw
