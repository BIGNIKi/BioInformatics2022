# Часть 1

1. [Референсный геном e.coli](/Part1/RefGenome_e_coli.fna.gz)
2. [Результат сиквенирования e.coli](/Part1/SRR_e_coli_fastq.gz)
3. [Ссылка на загруженные прочтения из NCBI SRA](https://www.ncbi.nlm.nih.gov/sra/SRX17802335[accn])
4. [Bash скрипт с реализованным алгоритмом](/Part1/my_bash_pipeline.sh)
5. [Результат команды samtools ﬂagstat](/Part1/flagstat_result.txt)

# Часть 2

Инструкция по развертыванию и установке фреймворка:
1) Проверить, что установлен Java 11 или более поздняя версия.  
```
java -version
```
2) Ввести команду в терминал, чтобы создать nextflow файл в текущей директории.  
```
curl -s https://get.nextflow.io | bash
```
3) Теперь можно запустить классический Hello world, используя следующую команду:  
```
./nextflow run hello
```
Как результат работы получаем:  
1. [папка work](/Part2/work)
2. [папка .nextflow](/Part2/.nextflow)
3. [логи](/Part2/.nextflow.log)

# Часть 3

1. [Код пайплайна на NextFlow](/Part3/tutorial.nf)
2. Все сгенерированные файлы в ходе работы пайплайна по умолчанию кладутся в папку out, пример [здесь](/Part3/out/)
3. По итогу в консоль выводится результат "OK" или "Not OK"
4. [Сгенерированный лог-файл](/Part3/.nextflow.log)
5. Визуализация пайплайна в виде графического файла:
<p align="center">
  <img src="/Part3/diagram.png"/>
</p>

Полученная схема визуализации отличается от блок-схемы алгоритма из задания:  
а) не указан процесс отработки fastqc процесса, с созданием .html файла, хотя fastqc успешно отрабатывает и создает отчет  
б) входные файлы на схеме не помечаются  
в) условный оператор на проверку процента и последующее ветвление отображается как отдельный процесс "parsePercent"  

Вывод в `stdout` после полной отработки пайплайна:
```
N E X T F L O W  ~  version 22.10.1
WARN: It appears you have never run this project before -- Option `-resume` is ignored
Launching `tutorial.nf` [hopeful_lichterman] DSL2 - revision: 5837aed161
executor >  local (5)
[77/27f572] process > index            [100%] 1 of 1 ✔
[bc/21489c] process > FastQC           [100%] 1 of 1 ✔
[19/32710e] process > minimap2         [100%] 1 of 1 ✔
[92/629676] process > samtoolsFlagstat [100%] 1 of 1 ✔
[9d/3a3cb8] process > parsePercent     [100%] 1 of 1 ✔
OK


```
P.S. .sam файлы не заливал в репозиторий из-за слишком большого размера (github ругается).
