#! /bin/bash

object_file_name='simplefunction.o'
executable_name='SimpleFunction'

echo 'Compiling a simple function in assembly code.'

as -g -o ${object_file_name} power.s

echo 'First step OK : file is compiled in object file.'

ld -o ${executable_name} ${object_file_name}

echo 'Second step OK : file is linked into an executable.'

./${executable_name}
result=$?

if [ $result -ne 0 ]; then
	echo '--> Launched the executable OK.'
	echo '--> Result : ' $result
	
else 
echo 'Error on the execution'
fi
