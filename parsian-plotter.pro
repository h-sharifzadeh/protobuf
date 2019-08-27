#-------------------------------------------------
#
# Project created by QtCreator 2018-07-04T13:04:25
#
#-------------------------------------------------


greaterThan(QT_MAJOR_VERSION, 5): QT += widgets
QT       += core gui opengl network widgets

CONFIG += c++11

TARGET = parsian-plotter
TEMPLATE = app

PROTOPATH += ./proto
PROTOPATHS =
for(p, PROTOPATH):PROTOPATHS += --proto_path=$${p}

protobuf_decl.name = protobuf header
protobuf_decl.input = PROTOS
protobuf_decl.output = ${QMAKE_FILE_BASE}.pb.h
protobuf_decl.commands = protoc --cpp_out="." $${PROTOPATHS} ${QMAKE_FILE_NAME}
protobuf_decl.variable_out = GENERATED_FILES
QMAKE_EXTRA_COMPILERS += protobuf_decl

protobuf_impl.name = protobuf implementation
protobuf_impl.input = PROTOS
protobuf_impl.output = ${QMAKE_FILE_BASE}.pb.cc
protobuf_impl.depends = ${QMAKE_FILE_BASE}.pb.h
protobuf_impl.commands = $$escape_expand(\n)
protobuf_impl.variable_out = GENERATED_SOURCES
QMAKE_EXTRA_COMPILERS += protobuf_impl


SOURCES += main.cpp\
        mainwindow.cpp \
    plot.cpp \
    plotterwidget.cpp \
    texturecache.cpp \
    guitimer.cpp \
    timer.cpp \
    leaffilterproxymodel.cpp \
    plotter.cpp \
    proto/cpp/messages_parsian_simurosot_data_wrapper.pb.cc \
    proto/cpp/messages_parsian_simurosot_debugs.pb.cc \
    proto/cpp/messages_parsian_simurosot_detection.pb.cc \
    proto/cpp/messages_parsian_simurosot_worldmodel.pb.cc \
    mythread.cpp

HEADERS  += mainwindow.h \
    plot.h \
    plotterwidget.h \
    texturecache.h \
    guitimer.h \
    timer.h \
    leaffilterproxymodel.h \
    plotter.h \
    proto/cpp/messages_parsian_simurosot_data_wrapper.pb.h \
    proto/cpp/messages_parsian_simurosot_debugs.pb.h \
    proto/cpp/messages_parsian_simurosot_detection.pb.h \
    proto/cpp/messages_parsian_simurosot_worldmodel.pb.h \
    mythread.h

FORMS    += \
    plotter.ui

RESOURCES +=

DISTFILES +=

MOC_DIR = objs
OBJECTS_DIR = objs

INCLUDEPATH+=proto/cpp
INCLUDEPATH+=/usr/local/Cellar/protobuf/3.6.1.3_1/include
LIBS+=-L/usr/X11R6/lib64 -L/usr/local/Cellar/protobuf/3.6.1.3_1/lib/ -lprotobuf -lprotobuf-lite -lQt5OpenGL -lQt5Widgets -lQt5Gui -lQt5Network -lQt5Xml -lQt5Core -lpthread -lGLU -lGL -lglut

