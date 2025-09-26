#!/bin/bash

read -p "Please Enter your Domain or Wildcard : " wild

subfinder -d $wild  -all -o subs.txt

echo $wild | assetfinder --subs-only >> subs.txt

read -p "Do you wanna to Continue ? (y/n) " answer

if [ $answer = "n" ] || [ $answer = "N" ] ;
then
	exit 0
	
else
	cat subs.txt | anew >> allsubs.txt

	rm subs.txt

	cat allsubs.txt | httpx -o httpx.txt -fc 200
fi



