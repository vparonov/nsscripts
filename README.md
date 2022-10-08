# nsscripts

## postprocess.pl
Скрипт за премахване на сричко-пренасянето и оформяне на текста в редове с ширина (около) 80 символа.

Пример за използване (тествано под Mac OS).

```
chmod +x postprocess.pl # разрешава файла за изпълнение
mkdir res # създава папка за резултати
for f in *.txt; do ./postprocess.pl $f > res/"un_"$f; done # обработва всички файлове от текущата папка и записва обработените в res
```

## annotate.pl
Скрипт за създаване на индекс на изказванията по изказали се.

Като резултат създава tab separated файл съдържащ име, файл и ред на който започва изказването.

Пример за използване (предполага се, че файловете вече са обработени с postproces.pl и се намират в папка res)

```
chmod +x annotate.pl
for f in res/*.txt; do ./annotate.pl $f >> res/tmp_annotations; done && \
  cat res/tmp_annotations | \
  sort > res/annotations && \
  rm res/tmp_annotations
# резултатът е във файл res/annotations 
```
