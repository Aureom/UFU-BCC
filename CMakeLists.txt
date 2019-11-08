cmake_minimum_required(VERSION 3.15)
project(Treinamento_C C)

set(CMAKE_C_STANDARD 99)

AUX_SOURCE_DIRECTORY("Lista 4" L4_APP_SOURCES)
foreach(FILE ${L4_APP_SOURCES})
    string(REPLACE ".c" "" NAME ${FILE})
    string(REPLACE "Lista 4/" "" NAME ${NAME})
    add_executable(${NAME} ${FILE})
endforeach()

AUX_SOURCE_DIRECTORY("Elaine/Aula11" EA11_APP_SOURCES)
foreach(FILE ${EA11_APP_SOURCES})
    string(REPLACE ".c" "" NAME ${FILE})
    string(REPLACE "Elaine/Aula11/" "EA11_" NAME ${NAME})
    add_executable(${NAME} ${FILE})
endforeach()