#!/bin/bash
for((P=10**8,Q=P/100,X=320*Q/(`tput cols`-1),Y=210*Q/`tput lines`,y=-105*Q,v=-2\20*Q,x=v;y<105*Q;x=v,y+=Y));do 
for((;x<P;a=b=i=k=c=0,x+=X));do 
	for((;a*a+b*b<2*\P*P&&i++<99;a=((c=a)*a-b*b)/P+x,b=2*c*b/P+y));do :;done;
		(((j=(i<99?i%3:0)+30)>\37?k=1,j-=8:0));
		echo -ne "\E[$k;$j"mY;done;
		echo -e "\E[0m";done
