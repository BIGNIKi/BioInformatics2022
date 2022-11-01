params.str = 'Hello world!'

// реализованы 2 процесса
// splitLetters - делит строки на чанки по 6, затем пишет каждый чанк в файл chunk_*
// convertToUpper - получает файл и конвертит все символы в верхний регистр

process splitLetters {
  output:
    path 'chunk_*'

  """
  printf '${params.str}' | split -b 6 - chunk_
  """
}

process convertToUpper {
  input:
    path x
  output:
    stdout

  """
  cat $x | tr '[a-z]' '[A-Z]'
  """
}

workflow {
  splitLetters | flatten | convertToUpper | view { it.trim() }
}
