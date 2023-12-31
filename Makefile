appname := a.out

CXX := g++
CXXFLAGS := -std=c++11 -Wall #-Werror

# Librarys
INCLUDE = -Iusr/local/include
LDFLAGS = -Lusr/local/lib
LDLIBS = -lcurl

srcfiles := $(shell find . -name "*.cpp")
objects  := $(patsubst %.cpp, %.o, $(srcfiles))

all: $(appname)

$(appname): $(objects)
	@$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(appname) $(objects) $(LDLIBS)

depend: .depend

.depend: $(srcfiles)
	rm -f .depend
	@$(CXX) $(CXXFLAGS) -MM $^>>.depend;

clean:
	rm -f $(objects)

dist-clean: clean
	rm -f *~ .depend

include .depend