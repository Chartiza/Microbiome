import random
from Bio.Seq import Seq

input = 'SRR13128014.fasta'
#input = 'sample2.fasta'

for n in range(0, 5):
    #make reads 1 files
    with open('ShortPE_reads1.fasta','a') as f:
        for l in open('{}'.format(input)):
            if '@' in l:
                data='>'+str(n)+l
                f.write(data)
            else:
                start=1000*n
                stop=start+150
                seq=l[start:stop]+'\n'
                f.write(seq)

    #make reads 2 files
    with open('ShortPE_reads2.fasta','a') as f:
        for l in open('{}'.format(input)):
            if '@' in l:
                data='>'+str(n)+l
                f.write(data)
            else:
                rn = random.randint(0, 100)
                start=1000*n+700+rn
                stop=start+150
                seqs=l[start:stop]
                seq = Seq(seqs)
                f.write(str(seq.reverse_complement())+'\n')
