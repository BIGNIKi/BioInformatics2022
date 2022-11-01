#!/bin/bash

# стандартный запуск pipeline'а
/home/bignik/Documents/GitHub/BioInformatics2022/Part2/nextflow run tutorial.nf

# в процессе запуска результат процессов кешируется и при помощи флага resume можно использовать
# закешированные данные для более быстрого процесса отработки pipeline'а
/home/bignik/Documents/GitHub/BioInformatics2022/Part2/nextflow run tutorial.nf -resume

# также можно передавать параметры через --paramName "sampleText"
# можно задать default значение для параметра params.paramName = 'Hello world!'

# Channel - FIFO queue
