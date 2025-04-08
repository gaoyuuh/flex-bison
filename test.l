%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "test.tab.h"
    extern int yylval;
%}

%%
"("     { return OP; }
")"     { return CP; }
"//".*  { /* 忽略注释 */ }
"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
"|"     { return ABS; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
\n      { return EOL; }
[ \t]   { /* 忽略空白字符 */ }
.       { printf("Mystery character %s\n", yytext); }
%%

int yywrap(void) {
    return 1;
}