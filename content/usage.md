+++
title = "Usage"
menu = "main"
weight = 5
+++

## Getting Started

1. Prepare an SSH key pair on your local computer.
1. Send the public key (`id_ed25519.pub` or `authorized_keys`)
   to [the administrator](mailto:iwasakiwt@soken.ac.jp?subject=[metal-sokendai] ssh public key).
1. Complete [the online registration form](https://goo.gl/forms/kxe6AWalGjH4wg5t2).
1. Accept the invitation to [the user mailing list](https://groups.google.com/forum/#!forum/metal-sokendai).
1. Login to the server: `ssh <USERNAME>@metal.campus.soken.ac.jp`

<!--more-->

## Basics

- All the computational tasks should be managed by the PBS job scheduler (see below).
  Do **NOT execute programs directly on the head node**.
- Your home directory `~/` is shared with all the nodes.
  You don't need to transfer your data to each compute node.
- **100GB** disk space is allocated for each user.
  The size may be changed in the future.


## How to submit a job

https://www.google.co.jp/search?q=pbs+scheduler
