+++
title = "Usage"
menu = "main"
weight = 5
+++

## Getting Started

1. [Prepare an SSH key pair on your local computer](#how-to-setup-ssh-keys).
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


## How to setup SSH keys

1.  Execute the following command on your local computer:
    ```
    % ssh-keygen -t ed25519 -N ''
    ```

    Press <kbd>return</kbd> to accept the default name of the key file:
    ```
    Generating public/private ed25519 key pair.
    Enter file in which to save the key (~/.ssh/id_ed25519): # return
    Your identification has been saved in ~/.ssh/id_ed25519.
    Your public key has been saved in ~/.ssh/id_ed25519.pub.
    ```

1.  Check the created keys:
    ```sh
    % ls -al ~/.ssh
    drwx------ 11 winston staff 374 Apr 04 10:00 ./
    -rw-------  1 winston staff 399 Apr 04 10:00 id_ed25519
    -rw-r--r--  1 winston staff  92 Apr 04 10:00 id_ed25519.pub
    ```
    The permissions of `~/.ssh` and `~/.ssh/id_ed25519` must be `700` and `600`, respectively.

1.  Copy and paste the whole content of the public key (**NOT** private key) to the online registration form.
    For example, `pbcopy` command is useful on macOS:
    ```sh
    % cat ~/.ssh/id_ed25519.pub | pbcopy
    ```

1.  After the administrator add your public key to your `~/.ssh/authorized_keys` on the server,
    you can login from the local computer with the private key `~/.ssh/id_ed25519`.


## How to submit a job

https://www.google.co.jp/search?q=pbs+scheduler
