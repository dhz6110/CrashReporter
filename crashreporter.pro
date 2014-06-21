#-------------------------------------------------
#
# Crash Reporter
#
#-------------------------------------------------

QT       += core gui network widgets

TARGET = crashreporter
TEMPLATE = app

CONFIG -= debug app_bundle
CONFIG += release c++11

SOURCES += \
    $$PWD/src/*.cpp \

HEADERS  += \
    $$PWD/src/*.h \

FORMS += \
    $$PWD/ui/*.ui \

OBJECTS_DIR = $$DESTDIR/obj
MOC_DIR = $$DESTDIR/obj
RCC_DIR = $$DESTDIR/obj
UI_DIR = $$DESTDIR/obj

win32 {
    LIBS += -lws2_32 -lkernel32 -luser32 -lshell32 -luuid -lole32 -ladvapi32
}

unix:!macx {
    LIBS += -Wl,-rpath=\\\$$ORIGIN/../lib #don't remove!!!
    CONFIG += static
    QMAKE_LFLAGS += -static-libgcc -static-libstdc++
}

DEFINES += RDM_VERSION="\\\"0.0.0\\\""
