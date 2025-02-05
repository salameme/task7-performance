CC ?= cc
CFLAGS ?= -g -Wall -O2
CXX ?= c++
CXXFLAGS ?= -O3 -std=c++17 -Wall -g
CARGO ?= cargo
RUSTFLAGS ?= -g
LDFLAGS = -lpthread

.PHONY: all clean

all: libmatrix.so libmandelbrot.so

clean:
	rm -f libmatrix.so libmandelbrot.so
# C++
# libmatrix.so: matrix.cpp
# 	$(CXX) $(CXXFLAGS) -shared -fPIC -o $@ $^ $(LDFLAGS)

# libmandelbrot.so: mandelbrot.cpp
# 	$(CXX) $(CXXFLAGS) -shared -fPIC -o $@ $^ $(LDFLAGS)

# Rust
# libmatrix.so:
# 	$(CARGO) build --release
# 	cp target/release/$@ .

# libmandelbrot.so:
# 	$(CARGO) build --release
# 	cp target/release/$@ .

# Usually there is no need to modify this
check: all
	$(MAKE) -C tests check
