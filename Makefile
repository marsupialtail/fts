# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -fopenmp -O3 -g -fPIC -std=c++17

# Linker flags
LDFLAGS = 

# Libraries to link
LIBS = -ldivsufsort -laws-cpp-sdk-s3 -laws-cpp-sdk-core -llz4 -lsnappy -lzstd -lglog

# Source files
SRCS = src/index.cc src/vfr.cc src/kauai.cc src/plist.cc

# Object files
OBJS = $(SRCS:.cc=.o)

# Target executable
EXEC = index

# Target shared object
LIB = libindex.so

all: $(EXEC) $(LIB)

$(EXEC): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(EXEC) $(LDFLAGS) $(LIBS)

$(LIB): $(OBJS)
	$(CXX) $(CXXFLAGS) -shared $(OBJS) -o $(LIB) $(LDFLAGS) $(LIBS)

%.o: %.cc
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(EXEC) $(LIB)

.PHONY: all clean
