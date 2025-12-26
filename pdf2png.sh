#!/bin/bash


__fuckedhelp__ (){
	echo "use ./pdf2png.sh file.pdf"
	echo 
	echo "some options - >"
	echo -n "-e\t"
	echo "--extension\t.png | .jpg - default jpg"
	echo "-p\t--page\t| page to print"
	echo "-h\t--help\t| help \\o/"
	echo "-o\t--out\t| out file"
	echo "--txt\t| transform pdf text in textformat"
	echo

};
help1="-h"
help0="--help"
case $help0 in
	$1 | $2 | $3 | $4 | $5 )
	__fuckedhelp__;
	exit 1;;
	
	*)
	echo
	;;
esac
case $help1 in
	$1 | $2 | $3 | $4 | $5 )
	__fuckedhelp__;
	exit 1;;
	
	*)
	echo
	;;
esac
output="-o"
out="--output"
case $output in
	$2)
		new_file=$2
		;;
	$3) 
		new_file=$3
		;;
	$4)
		new_file=$1
		;;
	$5) 
		new_file=$5
		;;
	$6)
		new_file=$6
		;;
	$7)
		new_file=$7
		;;
	$8)
		new_file=$8
		;;
	*)
		new_file=${1%.*}
	;;
esac

case $out in
	$2)
		new_file=$2
		;;
	$3) 
		new_file=$3
		;;
	$4)
		new_file=$1
		;;
	$5) 
		new_file=$5
		;;
	$6)
		new_file=$6
		;;
	$7)
		new_file=$7
		;;
	$8)
		new_file=$8
		;;
	*)
		new_file=${1%.*}
	;;
esac

page_=""
afs="-p"
afs0="--page"
case $afs in
	$2)
		one_page=1;
		page_=$3;
		
		;;
	$3)
		one_page=1;
		page_=$4;
	
		;;
	$4)
		one_page=1;
		page_=$5;
		
		;;
	$5) 
		one_page=1;
		page_=$6;
		
		;;
	$6)
		one_page=1;
		page_=$7;
	
		;;
	*)
		
esac
case $afs0 in
	$2)
		one_page=1;
		page_=$3;
		
		;;
	$3)
		one_page=1;
		page_=$4;
	
		;;
	$4)
		one_page=1;
		page_=$5;
		
		;;
	$5) 
		one_page=1;
		page_=$6;
		
		;;
	$6)
		one_page=1;
		page_=$7;
	
		;;
	*)
		if [ -z $page_ ]; then
			page_=1
		fi

		echo "print page $page_"
		;;
esac

if [ -z $1 ];
then
	echo "[?] use ./pdf2png.sh file.pdf --extension png";exit 0
else 
	if [ -f "$1" ];
	then
		echo "[*] file $1 to png"
	else
		echo "[!] file $1 doesnt exist"
		exit 1
	fi

fi

if [ -f "$new_file.jpg" ]; then
	new_file="$new_file(1).jpg"
else
	new_file="$new_file.jpg"
fi

afs0="--txt"
case $afs0 in
	$2 | $3 | $4 | $5 | $6 | $7)
	gs -dBATCH -dNOPAUSE -dFirstPage=$(($one_page)) -dLastPage=$(($page_)) -sDEVICE=txtwrite -sOutputFile=new_file.txt $1	
	;;
	*)
	gs -dBATCH -dNOPAUSE -dFirstPage=$(($page_)) -dLastPage=$(($page_)) -sDEVICE=jpeg -sOutputFile=$new_file $1
esac


