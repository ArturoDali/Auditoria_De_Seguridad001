# ! / bim / bash
#Programa 4.0 de Metodologia de hacking
#Mr.Robot

var= " "
dom= " "
opc= " "
pet= " "
sitio= " "
carpetahacking= " " 

echo " >>>>>>>>>> "
echo "  >>>>>>>>> "
echo "   >>>>>>>> "
echo "    >>>>>>> "
echo "     >>>>>> "
echo "      >>>>> "
echo "       >>>> "
echo "        >>> "
echo "         >> "
echo "          * "
echo "    	     Menu                 "


echo "Elige una opcion para que se realice la accion"
echo "1.- Cambiar la direccion mac"
echo "2.- Descargar las herremientas"
echo "3.- Iniciar auditoria de seguridad"
echo "0.- Salir"

read -p "Ingresa la opcion deseada : " opc
read -p "Ingresa el dominio deseado : " dom

case  $opc in 
	"1") ifconfig
	     ifconfig eth0 down
	     macchanger -r eth0
	     ifconfig eth0 up
	     ifconfig;;
     "2") echo "Estamos trabajando, opcion no valida aun";;

     "3") 	echo "***  Step 1, Analizar direcciones ip asociadas al dominio seleccionado">> archivo-$(date +%Y-%m-%d-%H-%M).txt
			host $dom >> archivo-$(date +%Y-%m-%d-%H-%M).txt

		#echo "Analizamos los dominios que predeceden del dominio principal">> archivo-$(date +%Y-%m-%d-%H-%M).txt
			#dnsenum $dom >> archivo-$(date +%Y-%m-%d-%H-%M).txt

		echo "***  Step2, se realiza un ping 10 veces para esperar respuesta del servidor">> archivo-$(date +%Y-%m-%d-%H-%M).txt
			ping -w 10 $dom >> archivo-$(date +%Y-%m-%d-%H-%M).txt
		
		echo "*** Step 3, Se realiza el analisis de l dominio con whois ">> archivo-$(date +%Y-%m-%d-%H-%M).txt
		whois $dom >> archivo-$(date +%Y-%m-%d-%H-%M).txt #Obtinene informacion del dominio en orden publico.

		echo "*** Step4, Se analiza el puerto 80  del dominio con netcat">>  archivo-$(date +%Y-%m-%d-%H-%M).txt
		netcat $dom 80>> archivo-$(date +%Y-%m-%d-%H-%M).txt #Obtiene la infomracion dle puerto 80 del servidor por medio de netcat

		echo "*** Step 5,Otras herramientas como WhatWeb">> archivo-$(date +%Y-%m-%d-%H-%M).txt
		whatweb $dom >> archivo-$(date +%Y-%m-%d-%H-%M).txt

		echo "*** Step 6, nslookup ">> archivo-$(date +%Y-%m-%d-%H-%M).txt
		nslookup >> archivo-$(date +%Y-%m-%d-%H-%M).txt
		set type=mx>> archivo-$(date +%Y-%m-%d-%H-%M).txt 
		set type=ns>> archivo-$(date +%Y-%m-%d-%H-%H).txt
		set type=txt
		$dom

		echo "*** Step 7">> archivo-$(date +%Y-%m-%d-%H-%M).txt
		sslscan $dom >> archivo -$(date +%Y-%m-%d-%H-%M).txt

		echo "*** Step 8">> archivo-$(date +%Y-%m-%d-%H-%M).txt
		nmap -A -O -v -T5 -P 1-65535 $dom >> archivo -$(date +%Y-%m-%d-%H-%M).txt;;#El parametro -A da un poco mas de informacion en comparacon a la -sV







	"00")	#read -p "En donde gaurdo la carpeta?" sitio
			read -p "Que nombre le pongo a la carpeta" carpetahacking
			#cd $sitio
			mkdir $carpetahacking
			cd $carpetahacking
			wget -r $dom>> archivomapeodeapp.txt #-r recursivamente se busca el dominio que seleccionamos
			echo "Awbo">archivo.txt;; #Recuerda que se debe de analizar el archivo de robots, y ver que esta habilitado o desabilitado, si esta habilitado						  #puede poner el nombre de la vulneravilidad junto a la pagina como www.platzi.com/comprar/  y eso puede crear una indexacion						 #en la pagina web, ojo con bakups, passwords etc.

	"0") break ;; 



esac #finaliza el case
#clear
exit 0
