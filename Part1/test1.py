import sys

if __name__ == '__main__':
  file_name = sys.argv[1]
  file1 = open(file_name, 'r')
  mylist = []
  for i, line in enumerate(file1):
    if i == 7:
      mylist = line.split("(")
      file1.close()
      break;
  
  b = mylist[1].split("%")
  
  if float(b[0]) > 90.0:
    print("OK")
  else:
    print("Not OK") 
