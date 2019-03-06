+++
title = "Software"
menu = "main"
weight = 20
+++

## OS

CentOS 7.3 x86_64

### System Library

`/usr/bin`, `/bin`

- Shells
    - bash 4.2.46
    - zsh 5.0.2
- Editors
    - emacs 24.3.1
    - vi 7.5
    - nano 2.3.1
- Compilers and interpreters
    - gcc 4.8.5
    - clang 3.4.2 (EPEL)
    - libc++ 3.8.0 (EPEL)
    - python 2.7.5
    - ruby 2.0.0p648
- Other tools
    - git 1.8.3.1

Some tools are available in newer version. See below.

### Job Management System

`/opt/pbs`

[PBS Professional](http://pbspro.org/) 14.0.1


## Additional Tools

Additional tools are installed with [Linuxbrew](http://linuxbrew.sh/)
to `/home/linuxbrew/.linuxbrew/` if available.
Otherwise, they are manually installed to `/home/local/`.
The environment variable `PATH` for their `bin`s is preset for all users.

### Compilers, Interpreters, and Libraries

- gcc 5.5
- clang 7.0 (libc++ is not available yet)
- python 3.7
- R 3.5
- boost 1.68
- eigen 3.3.7
- gsl 2.5

### General tools

- tmux 2.8
- cmake 3.13
- git 2.19
- emacs 26.1
- nano 3.2

### Bioinformatics tools

- bedtools 2.27.1
- blast 2.8.1
- bowtie2 2.3.4
- bwa 0.7.17
- gatk 4.0.11
- gffread 0.10.8
- hisat2 2.1.0
- htslib 1.9
- libsequence
- mafft 7.407
- paml 4.9h
- RAxML 8.2.12
- RepeatMasker 4.0.7
- RepeatModeler 1.0.8
- RepeatScout 1.0.5
- samtools 1.9
- SeqKit 0.10.1
- stringtie 1.3.4d
- structure 2.3.4
- varscan 2.4.3
- velvet 1.2.10

### Python packages

`/home/linuxbrew/.linuxbrew/lib/python3.7/site-packages/`

- numpy
- scipy
- pandas
- scikit-learn
- matplotlib
- seaborn
- biopython
- Pillow

### R packages

`/home/linuxbrew/.linuxbrew/lib/R/3.5/site-library`

- ape
- BioConductor (Biostrings, GenomicRanges, *etc.*)
- cowplot
- igraph
- Rcpp
- rgl
- rstan
- tidyverse (ggplot2, dplyr, tidyr, *etc.*)
