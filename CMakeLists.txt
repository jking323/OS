#Author: Jeremy King
#Version: 0.01a
#11/24/2020
cmake_minimum_required(VERSION 3.17)
project(OS C)

set(CMAKE_C_STANDARD 99)

add_executable(OS kernel.c)
