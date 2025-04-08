CC = gcc
CFLAGS = -Wall
LIBS = -ll

calc: lex.yy.c test.tab.c
	$(CC) $(CFLAGS) -o calc test.tab.c lex.yy.c $(LIBS)

lex.yy.c: test.l test.tab.h
	flex test.l

test.tab.c test.tab.h: test.y
	bison -d test.y

clean:
	rm -f calc lex.yy.c test.tab.c test.tab.h

.PHONY: clean 