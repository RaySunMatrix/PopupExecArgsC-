cmake_minimum_required(VERSION 3.28)
project(PopupExecArgsC__)

set(CMAKE_CXX_STANDARD 17)

add_executable(PopupExecArgsC__ main.cpp
        ReportReference/report_exec/validObjects.cpp
        ReportReference/report_exec/validObjects.h
        ReportReference/report_exec/listObjects.cpp
        ReportReference/report_exec/listObjects.h
        ReportReference/report_exec/console.c++
        ReportReference/report_exec/console.c++
        ReportReference/report_exec/happyExec.c++
        ReportReference/report_exec/totalInteral.c++
        ReportReference/report_total/totalTime.c++)
