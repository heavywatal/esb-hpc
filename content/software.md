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
    - libc++ 3.8.0 (EPEL)
    - python 2.7.5
    - ruby 2.0.0p648
    - R 3.4.4 (EPEL)
- Other tools
    - git 1.8.3.1

Some tools are available in newer version. See below.

### Job Management System

`/opt/pbs`

[PBS Professional](http://pbspro.org/) 14.0.1


## Additional Tools

Additional tools are installed with [Linuxbrew](http://linuxbrew.sh/)
to `/home/linuxbrew/.linuxbrew/`.
The environment variable `PATH` for the `bin` is preset for all users.

### Compilers, Interpreters, and Libraries

- gcc 5.5
- clang 6.0
- python 3.6
    - numpy
    - scipy
    - pandas
    - matplotlib
    - seaborn
    - biopython
    - Pillow
- boost ≥1.67
- eigen ≥3.3.4
- gsl ≥2.4

### General tools

- tmux ≥2.7
- cmake ≥3.11
- git ≥2.17
- emacs ≥25.3
- nano ≥2.9.5

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
- repeatmasker
- samtools
- varscan
