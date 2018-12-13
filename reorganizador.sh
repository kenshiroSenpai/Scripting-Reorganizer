#!/bin/bash
ls > fichero1.txt
if [ -d /$1/Imagenes ] || [ -d $1/Directorios ] || [ -d $1/Otros ]; then
echo "Las carpetas ya existen";
exit
else
mkdir $1/Imagenes;
mkdir $1/Directorios;
mkdir $1/Otros;
fi
for line in $(cat fichero1.txt); 
do
if [ $line != $1 ]; then
if [[ $(file $line) == *"JPEG image data"* ]] || [[ $(file $line) == *"PNG image data"* ]] || [[ $(file $line) == *"BMP image data"* ]] || [[ $(file $line) == *"JPG image data"* ]]; then
mv $line $1/Imagenes;
elif [[ $(file $line) == *"directory"* ]]; then
mv $line $1/Directorios;
else
mv $line $1/Otros;
fi
fi
done
