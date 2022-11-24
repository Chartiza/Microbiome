# !/usr/bin/python
import os

with open('change_header_list.csv') as f:
    lines = f.read().splitlines()
f.close()

for n in lines:
    print('Run '+n+' ...')
    with open('assembly_'+n+'/'+n+'.final.contigs.fa','w') as f:
        for l in open('assembly_'+n+'/final.contigs.fa'):
            if l.startswith('>'):
                data='>'+n+'c'+l[1:]
                f.write(data)
            else:
                f.write(l)
