cmake_minimum_required(VERSION 3.2)

# set project name
set(PROJECT_NAME "project3")

# set language
project(${PROJECT_NAME} LANGUAGES CXX)

# set sources
set(SOURCES
main.cpp
Project3a.h
Project3a.cpp
Graph.h
Graph.cpp
)

# creating the executable
add_executable(${PROJECT_NAME} ${SOURCES})