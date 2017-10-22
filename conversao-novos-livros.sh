#!/bin/bash

convert_image(){
    caminho_imagem=$1
    filename=$(ls $caminho_imagem | awk -F. '{ print $1 }')
    magick convert $filename.jpg $filename.png
}

varrer_diretorio(){
    cd $1
    for arquivo in *
    do
        local caminho_arquivo=$(find ~/Downloads/imagens-novos-livros -name $arquivo)
        if [ -d $caminho_arquivo ]
        then
            varrer_diretorio $caminho_arquivo
        else
            convert_image $caminho_arquivo
        fi
    done
}

varrer_diretorio ~/Downloads/imagens-novos-livros
if [ $? -eq 0 ]
then
    echo 'conversão realizada com sucesso'
else
    echo 'houve um problema na conversão'
fi