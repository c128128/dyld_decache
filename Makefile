TARGET = dyld_decache
LIBS = /usr/local/lib/libboost_filesystem-mt.a /usr/local/lib/libboost_system-mt.a
CPP = clang++
CFLAGS = -g -Wall -Wextra -std=c++98 -I/usr/local/include
LFLAGS = -Wall 

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.cpp, %.o, $(wildcard *.cpp))
HEADERS = $(wildcard *.h)

%.o: %.cpp $(HEADERS)
	$(CPP) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CPP) $(OBJECTS) $(LFLAGS) $(LIBS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)
