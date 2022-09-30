# Cut reads shorter than 50 bp
#in1 = 'sample_PE1.fasta'
#in2 = 'sample_PE2.fasta'
in1 = 'ShortPE_reads1.fasta'
in2 = 'ShortPE_reads2.fasta'

lst1 = []
lst2 = []

# Remove reads shorter than 50 from forvard read file
with open('ShortPE_out1.fasta','w') as f:
  for l in open('{}'.format(in1)):
    if '>' in l:
      name=l
    else:
      if len(l)>100:
          lst1.append(name)
          f.write(name)
          f.write(l)


# Remove reads shorter than 50 from reverse read file
with open('ShortPE_out2.fasta','w') as f:
  for l in open('{}'.format(in2)):
    if '>' in l:
      name=l
    else:
      if len(l)>100:
          lst2.append(name)
          f.write(name)
          f.write(l)

# Find shared names
lst = set(lst1).intersection(set(lst2))


# Keep only shares reads at forvard file
with open('ShortPE_fin1.fasta','w') as f:
  for l in open('ShortPE_out1.fasta'):
    if '>' in l:
      if l in lst:
          name=l
          count=1
      else:
          count=0
    else:
      if count==1:
        f.write(name)
        f.write(l)

# Keep only shares reads at reverse file
with open('ShortPE_fin2.fasta','w') as f:
  for l in open('ShortPE_out2.fasta'):
    if '>' in l:
      if l in lst:
          name=l
          count=1
      else:
          count=0
    else:
      if count==1:
        f.write(name)
        f.write(l)
