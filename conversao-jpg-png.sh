#!/bin/bash

image_convert_to_png() {

    cd ~/Downloads/imagens-livros
    verify_exists_folder png

    for image in *.jpg
    do
        local filename=$(ls $image | awk -F. '{ print $1 }')
        magick convert $filename.jpg png/$filename.png
    done
}

verify_exists_folder() {
    if [ ! -d $1 ] # verificando se o diretório não existe
    then
        mkdir $1
        echo 'criei a pasta chamada "png"...'
        return $1
    fi
}

# status de saída = 0 sucesso - 1 - 255 teve alguma falha
image_convert_to_png 2>errors_conversao.txt # saída de erros para arquivo

# pegando status de saída
if [ $? -eq 0 ] 
then
    echo 'Conversão realizada com sucesso :)'
else
    echo 'Houve uma falha no processo :('
fi