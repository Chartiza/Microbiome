#Modify depth file for MaxBin2 program
import sys
name=sys.argv[1]

with open('{}/coverage/{}.maxbin.depth.txt'.format(name, name),'w') as f:
      for l in open('{}/metabat2/{}.depth.txt'.format(name, name)):
          data=l.rstrip().split('\t')
          if data[0]!='contigName':
              f.write(data[0]+'\t'+data[2]+'\n')
