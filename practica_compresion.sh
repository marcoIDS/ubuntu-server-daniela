#!/bin/bash
rm -rf practica_compresion

mkdir -p practica_compresion/{texto,imagen,audio,video}
cd practica_compresion/texto

wget https://www.gutenberg.org/files/1342/1342-0.txt -o texto.txt
wget https://raw.githubusercontent.com/matiassingers/awesome-readme/master/README.md -o ejemplo.md
wget https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf -o dummy.pdf
cd ../imagen

wget https://upload.wikimedia.org/wikipedia/commons/3/3f/Fronalpstock_big.jpg -o montaña.jpg
wget https://upload.wikimedia.org/wikipedia/commons/3/34/Wget-screenshot.png -o prueba.png
wget https://filesamples.com/samples/image/bmp/sample_640%C3%97426.bmp -o foto.bmp
cd ../audio

wget https://file-examples.com/wp-content/storage/2017/11/file_example_WAV_1MG.wav -o example1.wav
wget https://file-examples.com/storage/fe6e058871699c5569f0624/2017/11/file_example_MP3_700KB.mp3 -o example2.mp3
wget https://file-examples.com/storage/fe6e058871699c5569f0624/2017/11/file_example_OOG_2MG.ogg -o example3.ogg
cd ../video

wget https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_1MB.mp4 -o video_corto.mp4
wget https://filesamples.com/samples/video/avi/sample_960x400_ocean_with_audio.avi -o video_corto_2.avi
wget https://filesamples.com/samples/video/mov/sample_640x360.mov -o video_corto_3.mov
cd ..

echo "resultados compresion" >> .resultados_compresion.txt
echo "" >> resultados_compresion.txt
echo "Archivos originales" >> resultados_compresion.txt

find . -type f -not -path "*/\.*" -exec bash -c 'ext="${1##*.}"; ext_upper=$(echo "$ext" | tr "[:lower:]" "[:upper:]"); case $ext in txt|md|pdf) tipo="Texto";; jpg|jpeg|png|bmp|gif) tipo="Imagen";; mp3|wav|ogg|flac) tipo="Audio";; mp4|avi|mov|mkv) tipo="Video";; *) tipo="Otro";; esac; echo -e "Nombre: $(basename "$1")\nRuta: $1\nTipo: $tipo ($ext_upper)\nTamaño: $(ls -lh "$1" | awk "{print \$5}")\n---"' _ {} \; >> resultados_compresion.txt

echo "" >> resultados_compresion.txt

cd texto
echo "Compresion con gzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v texto.txt" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="texto.txt" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v texto.txt
ruta_base=$(pwd) && archivo="texto.txt.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v ejemplo.md" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="ejemplo.md" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v ejemplo.md
ruta_base=$(pwd) && archivo="ejemplo.md.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v dummy.pdf" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="dummy.pdf" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v dummy.pdf
ruta_base=$(pwd) && archivo="dummy.pdf.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Decompresion con gunzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v dummy.pdf.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="dummy.pdf.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v dummy.pdf.gz
ruta_base=$(pwd) && archivo="dummy.pdf" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v ejemplo.md.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="ejemplo.md.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v ejemplo.md.gz
ruta_base=$(pwd) && archivo="ejemplo.md" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v texto.txt.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="texto.txt.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v texto.txt.gz
ruta_base=$(pwd) && archivo="texto.txt" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Compresion con zip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip texto.zip texto.txt  " >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="texto.txt" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip texto.zip texto.txt
ruta_base=$(pwd) && archivo="texto.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip ejemplo.zip ejemplo.md" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="ejemplo.md" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip ejemplo.zip ejemplo.md
ruta_base=$(pwd) && archivo="ejemplo.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip dummy.zip dummy.pdf" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="dummy.pdf" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip dummy.zip dummy.pdf
ruta_base=$(pwd) && archivo="dummy.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Decompresion con unzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt
rm ejemplo.md dummy.pdf texto.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip ejemplo.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="ejemplo.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip ejemplo.zip
ruta_base=$(pwd) && archivo="ejemplo.md" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip dummy.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="dummy.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip dummy.zip
ruta_base=$(pwd) && archivo="dummy.pdf" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip texto.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="texto.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip texto.zip
ruta_base=$(pwd) && archivo="texto.txt" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Compresion con rar" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a ejemplo.rar ejemplo.md" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="ejemplo.md" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a ejemplo.rar ejemplo.md
ruta_base=$(pwd) && archivo="ejemplo.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a dummy.rar dummy.pdf" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="dummy.pdf" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a dummy.rar dummy.pdf
ruta_base=$(pwd) && archivo="dummy.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a texto.rar texto.txt" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="texto.txt" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a texto.rar texto.txt
ruta_base=$(pwd) && archivo="texto.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt

echo "Decompresion con unrar" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt
rm ejemplo.md dummy.pdf texto.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x ejemplo.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="ejemplo.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x ejemplo.rar
ruta_base=$(pwd) && archivo="ejemplo.md" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x dummy.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="dummy.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x dummy.rar
ruta_base=$(pwd) && archivo="dummy.pdf" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x texto.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="texto.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x texto.rar
ruta_base=$(pwd) && archivo="texto.txt" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

cd ../imagen
echo "Compresion con gzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v montaña.jpg" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="montaña.jpg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v montaña.jpg
ruta_base=$(pwd) && archivo="montaña.jpg.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v prueba.png" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="prueba.png" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v prueba.png
ruta_base=$(pwd) && archivo="prueba.png.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v foto.bmp" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="foto.bmp" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v foto.bmp
ruta_base=$(pwd) && archivo="foto.bmp.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Decompresion con gunzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v montaña.jpg.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="montaña.jpg.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v montaña.jpg.gz
ruta_base=$(pwd) && archivo="montaña.jpg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v prueba.png.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="prueba.png.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v prueba.png.gz
ruta_base=$(pwd) && archivo="prueba.png" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v foto.bmp.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="foto.bmp.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v foto.bmp.gz
ruta_base=$(pwd) && archivo="foto.bmp" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Compresion con zip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip montaña.zip montaña.jpg" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="montaña.jpg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip montaña.zip montaña.jpg
ruta_base=$(pwd) && archivo="montaña.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip prueba.zip prueba.png" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="prueba.png" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip prueba.zip prueba.png
ruta_base=$(pwd) && archivo="prueba.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip foto.zip foto.bmp" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="foto.bmp" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip foto.zip foto.bmp
ruta_base=$(pwd) && archivo="foto.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Decompresion con unzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt
rf montaña.jpg prueba.png foto.bmp

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip montaña.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="montaña.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip montaña.zip
ruta_base=$(pwd) && archivo="montaña.jpg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip prueba.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="prueba.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip prueba.zip
ruta_base=$(pwd) && archivo="prueba.png" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip foto.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="foto.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip foto.zip
ruta_base=$(pwd) && archivo="foto.bmp" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Compresion con rar" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a montaña.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="montaña.jpg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a montaña.rar montaña.jpg
ruta_base=$(pwd) && archivo="montaña.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a prueba.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="prueba.png" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a prueba.rar prueba.png
ruta_base=$(pwd) && archivo="prueba.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a foto.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="foto.bmp" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a foto.rar foto.bmp
ruta_base=$(pwd) && archivo="foto.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Decompresion con unrar" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt
rm montaña.jpg prueba.png foto.bmp

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x montaña.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="montaña.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x montaña.rar
ruta_base=$(pwd) && archivo="montaña.jpg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x prueba.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="prueba.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x prueba.rar
ruta_base=$(pwd) && archivo="prueba.png" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x foto.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="foto.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x foto.rar
ruta_base=$(pwd) && archivo="foto.bmp" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

cd ../audio
echo "Compresion con gzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v example1.wav" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example1.wav" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v example1.wav
ruta_base=$(pwd) && archivo="example1.wav.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v example2.mp3" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example2.mp3" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v example2.mp3
ruta_base=$(pwd) && archivo="example2.mp3.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v example3.ogg" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example3.ogg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v example3.ogg
ruta_base=$(pwd) && archivo="example3.ogg.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Descompresion con gunzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v example1.wav.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example1.wav.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v example1.wav.gz
ruta_base=$(pwd) && archivo="example1.wav" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v example2.mp3.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example2.mp3.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v example2.mp3.gz
ruta_base=$(pwd) && archivo="example2.mp3" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v example3.ogg.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example3.ogg.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v example3.ogg.gz
ruta_base=$(pwd) && archivo="example3.ogg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "Compresion con zip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip example1.zip example1.wav" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example1.wav" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip example1.zip example1.wav
ruta_base=$(pwd) && archivo="example1.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip example2.zip example2.mp3" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example2.mp3" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip example2.zip example2.mp3
ruta_base=$(pwd) && archivo="example2.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip example3.zip example3.ogg" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example3.ogg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip example3.zip example3.ogg
ruta_base=$(pwd) && archivo="example3.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Descompresion con unzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt
rm example1.wav example2.mp3 example3.ogg

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip example1.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example1.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip example1.zip
ruta_base=$(pwd) && archivo="example1.wav" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip example2.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example2.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip example2.zip
ruta_base=$(pwd) && archivo="example2.mp3" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip example3.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example3.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip example3.zip
ruta_base=$(pwd) && archivo="example3.ogg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Compresion con rar" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a example1.rar example1.wav" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example1.wav" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a example1.rar example1.wav
ruta_base=$(pwd) && archivo="example1.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a example2.rar example2.mp3" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example2.mp3" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a example2.rar example2.mp3
ruta_base=$(pwd) && archivo="example2.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a example3.rar example3.ogg" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example3.ogg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a example3.rar example3.ogg
ruta_base=$(pwd) && archivo="example3.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Decompresion con unrar" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt
rm example1.wav example2.mp3 example3.ogg


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x example1.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example1.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x example1.rar
ruta_base=$(pwd) && archivo="example1.wav" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x example2.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example2.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x example2.rar
ruta_base=$(pwd) && archivo="example2.mp3" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x example3.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="example3.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x example3.rar
ruta_base=$(pwd) && archivo="example3.ogg" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

cd ../video
echo "Compresion con gzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v video_corto.mp4" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto.mp4" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v video_corto.mp4
ruta_base=$(pwd) && archivo="video_corto.mp4.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v video_corto_2.avi" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto_2.avi" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v video_corto_2.avi
ruta_base=$(pwd) && archivo="video_corto_2.avi.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gzip -v video_corto_3.mov" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto_3.mov" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gzip -v video_corto_3.mov
ruta_base=$(pwd) && archivo="video_corto_3.mov.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Decompresion con gunzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v video_corto.mp4.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto.mp4.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v video_corto.mp4.gz
ruta_base=$(pwd) && archivo="video_corto.mp4" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v video_corto_2.avi.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto_2.avi.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v video_corto_2.avi.gz
ruta_base=$(pwd) && archivo="video_corto_2.avi" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: gunzip -v video_corto_3.mov.gz" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto_3.mov.gz" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
gunzip -v video_corto_3.mov.gz
ruta_base=$(pwd) && archivo="video_corto_3.mov" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Compresion con zip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip video.zip video_corto.mp4" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto.mp4" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip video.zip video_corto.mp4
ruta_base=$(pwd) && archivo="video.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip video2.zip video_corto_2.avi" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto_2.avi" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip video2.zip video_corto_2.avi
ruta_base=$(pwd) && archivo="video2.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: zip video3.zip video_corto_3.mov" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto_3.mov" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
zip video3.zip video_corto_3.mov
ruta_base=$(pwd) && archivo="video3.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "Decompresion con unzip" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt
rm video_corto.mp4 video_corto_2.avi video_corto_3.mov

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip video.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip video.zip
ruta_base=$(pwd) && archivo="video_corto.mp4" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip video2.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video2.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip video2.zip
ruta_base=$(pwd) && archivo="video_corto_2.avi" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unzip video3.zip" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video3.zip" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unzip video3.zip
ruta_base=$(pwd) && archivo="video_corto_3.mov" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "Compresion con rar" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a video.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto.mp4" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a video.rar video_corto.mp4
ruta_base=$(pwd) && archivo="video.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a video2.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto_2.avi" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a video2.rar video_corto_2.avi
ruta_base=$(pwd) && archivo="video2.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: rar a video3.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video_corto_3.mov" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo original: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
rar a video3.rar video_corto_3.mov
ruta_base=$(pwd) && archivo="video3.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "Descompresion con unrar" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt
rm video_corto.mp4 video_corto_2.avi video_corto_3.mov

echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x video.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x video.rar
ruta_base=$(pwd) && archivo="video_corto.mp4" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x video2.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video2.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x video2.rar
ruta_base=$(pwd) && archivo="video_corto_2.avi" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: unrar x video3.rar" >> ../resultados_compresion.txt
ruta_base=$(pwd) && archivo="video3.rar" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "Archivo comprimido: $ruta_absoluta ($tamano)" >> ../resultados_compresion.txt
unrar x video3.rar
ruta_base=$(pwd) && archivo="video_corto_3.mov" && ruta_absoluta="$ruta_base/$archivo" && tamano=$(ls -lh "$ruta_absoluta" | awk '{print $5}')
echo "tamaño recuperado: $tamano" >> ../resultados_compresion.txt
echo "" >> ../resultados_compresion.txt


echo "----------------------" >> ../resultados_compresion.txt
echo "Comando: ls -l" >> ../resultados_compresion.txt
ls -l >> ../resultados_compresion.txt