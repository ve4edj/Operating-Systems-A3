#!/usr/bin/make

PRGM   = fatshell
SRCS   = shell.c fat_fs.c fat_helpers.c
LIBS   = 
CFLAGS = -std=c99 -g -Wall

#note to future self: do not modify below this line :)

CC     = gcc
ODIR   = bin
OBJS   = $(SRCS:%.c=$(ODIR)/%.o)
LFLAGS = $(LIBS:%=-l%)

$(PRGM): $(OBJS) $(ODIR)
	$(CC) -o $(PRGM) $(OBJS) $(LFLAGS) $(CFLAGS)

$(ODIR)/%.o: %.c $(ODIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(ODIR):
	mkdir $(ODIR)

all: clean $(PRGM)

clean:
	rm -rf $(PRGM) $(OBJS) $(ODIR)

release: $(PRGM)
	rm -rf $(OBJS) $(ODIR)

# Generic small-project makefile
# Copyright (c) 2014-2016 Erik Johnson (ve4edj)

# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
# (the "Software"), to deal in the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit
# persons to whom the Software is furnished to do so, subject to the following conditions:
# 1) The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# 2) THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR 
# IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.