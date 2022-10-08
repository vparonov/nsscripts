# nsscripts

## postprocess.pl
Скрипт за премахване на сричко-пренасянето и оформяне на текста в редове с ширина (около) 80 символа.

Пример за използване (тествано под Mac OS).
```
chmod +x postprocess.pl
mkdir res 
for f in *.txt; do ./postprocess.pl $f > res/"un_"$f; done
```
