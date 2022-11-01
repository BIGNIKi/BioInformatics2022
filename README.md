# Часть 1

1. [Референсный геном e.coli](/Part1/RefGenome_e_coli.fna.gz)
2. [Результат сиквенирования e.coli](/Part1/SRR_e_coli_fastq.gz)
3. [Ссылку на загруженные прочтения из NCBI SRA](https://www.ncbi.nlm.nih.gov/sra/SRX17802335[accn])
4. [Скрипт на bash с реализованным алгоритмом](/Part1/my_bash_pipeline.sh)
5. [Результат команды samtools ﬂagstat](/Part1/flagstat_result.txt)

# Часть 2

Инструкцию по развертыванию и установке фреймворка:
1) Проверить, что установлен Java 11 или более поздняя версия.  
```
java -version
```
2) Ввести команду в терминал  
```
curl -s https://get.nextflow.io | bash
```
Создастся nextflow файл в текущей директории.  
3) Теперь можно запустить классический Hello world, используя следующую команду  
```
./nextflow run hello
```
Как результат работы получаем:  
1. [папка work](/Part2/work)
2. [папка .nextflow](/Part2/.nextflow)
3. [логи](/Part2/.nextflow.log)
