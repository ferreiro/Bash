# Code to move all my mp3 files to a folder :-)
#!/bin/bash

# TODO: Una version que si pones "all" automaticamente te 
# mueva todos los archivos de todos los tipos cada una a su respectiva carpeta ".psd" "jpg"

args=("$@") # Parameters pass by console
OUTPUTDIRECTORY=tmp # name of directory to move the files
FILE_TYPE=ull

function createAndMove {

	TYPE=$1 # pass the file type via parameter 
	OUT_DIR=$2 # pass the directory via second parameter 
 
	if [ $TYPE == "null" ]; then
		echo "Null format" # if for some reason the file type is null. Then exit
		exit 1 # terminate and indicate error
	fi

	# Checks if the output directory exists.
	# not exists? Create a new directory

	if test -d $OUT_DIR
	then
		echo "Directoy already exists...[OK]"
		echo "If you want to re-classify this files remove the $OUT_DIR and run the code again"
		echo "Exit the Function"
	else

		echo "$OUT_DIR directory doesn't exist..."
		echo "Creating Directoy...[ok]"
		
		mkdir $OUT_DIR # creates a directory
 
		echo File type is: $TYPE
		echo Output directory is: $OUT_DIR

		# If the format are allowed. 
		# Creates a folder and move all the files of this type to the folder


		# TODO: Que solo copie los archivos de ./, no del resto de subcarpetas.
		# porque este código lo que hace es mirar todos los archivos con esa extensión
		# en la carpeta principal y subcarpetas...

		find . -name '*.'$TYPE -type f -print0 | xargs -0 -I list mv list ${OUT_DIR}

		# The './*.'$TYPE'*', is a regex that find all the files with *.Extension. That means
		# *.mp3 (where the $TYPE is a local variable like: pdf or mp3.)
		# *.mp3* (will find all the elements with that extension in ALL the folder)
		# If you only want all files in the CURRENT directory, only use *.mp3

	fi
}
if [ ${args[0]} == "all" ]; then

	echo "not yet"
	# createAndMove dmg dmg
	# createAndMove pkg pkg
	# createAndMove tar.gz tar.gz
	# createAndMove rar rar
	# createAndMove mov mov
	# createAndMove wav wav
	# createAndMove m4a m4a
	# createAndMove avi avi
	
elif [ ${args[0]} == "pdf" ]; then

	FILE_TYPE=pdf
	OUTPUTDIRECTORY=pdf
	createAndMove $FILE_TYPE $OUTPUTDIRECTORY # call the function and pass pdf and output directory parameters

elif [ ${args[0]} == "mp3" ]; then

	FILE_TYPE=mp3
	OUTPUTDIRECTORY=mp3
	createAndMove $FILE_TYPE $OUTPUTDIRECTORY # call the function and pass pdf and output directory parameters

elif [ ${args[0]} == "torrent" ]; then

	FILE_TYPE=torrent
	OUTPUTDIRECTORY=torrent
	createAndMove $FILE_TYPE $OUTPUTDIRECTORY # call the function and pass pdf and output directory parameters

elif [ ${args[0]} == "jpg" ]; then

	FILE_TYPE=jpg
	OUTPUTDIRECTORY=jpg
	createAndMove $FILE_TYPE $OUTPUTDIRECTORY # call the function and pass pdf and output directory parameters

elif [ ${args[0]} == "zip" ]; then

	FILE_TYPE=zip
	OUTPUTDIRECTORY=zip
	createAndMove $FILE_TYPE $OUTPUTDIRECTORY # call the function and pass pdf and output directory parameters

else
	echo "${args[0]} parameter is not accepted"
	echo "Accepted formats are: mp3, torrent, pdf, zip, jpg"
	exit 1 # terminate and indicate error
fi
 
exit 0 # termination with success

# find . -iname "*.mp3" -print
# find . -iname "*.mp3" -type f -exec /bin/mv {} /mnt/mp3 \;
