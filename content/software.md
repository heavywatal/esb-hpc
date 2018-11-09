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
- boost ≥1.67
- eigen ≥3.3.5
- gsl ≥2.5

### General tools

- tmux ≥2.8
- cmake ≥3.12
- git ≥2.19
- emacs ≥26.1
- nano ≥3.1

### Bioinformatics tools

- bedtools
- bowtie2
- bwa
- blast
- gatk
- hisat2
- htslib
- libsequence
- mafft
- paml
- RAxML
- RepeatMasker
- RepeatModeler
- RepeatScout
- samtools
- structure
- varscan

### Python packages

`/home/linuxbrew/.linuxbrew/lib/python3.6/site-packages/`

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
