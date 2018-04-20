+++
title = "Usage"
menu = "main"
weight = 5
+++

## Getting Started

1. [Prepare an SSH key pair on your local computer]({{< relref "usage.md#how-to-setup-ssh-keys" >}}).
1. Complete [the online registration form](https://goo.gl/forms/kxe6AWalGjH4wg5t2).
1. Accept the invitation to [the user mailing list](https://groups.google.com/forum/#!forum/metal-sokendai).
1. Login to the server: `ssh <USERNAME>@metal.campus.soken.ac.jp`

<!--more-->

## Basics

- The server is accessible only from the ESB campus LAN.
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

1.  (Optional) Create `~/.ssh/config` on your local computer:
    ```
    Host metal
      Hostname metal.campus.soken.ac.jp
      User your_username
    ```
    Then you can login to the server with the shorter command: `ssh metal`.


## PBS job scheduler

[Documentation](https://www.google.co.jp/search?q=pbs+professional+14)

### Check ths system status

```
% pbsnodes -aSj
```

### `qsub`: Submit a job

You can submit a job from command line or by using scripts:
```sh
% qsub -S /bin/sh -N jobname -- /path/to/your/executable [args...]
    # or
% qsub hello.sh
```

An example job script `hello.sh`:
```sh
#!/bin/sh
#PBS -S /bin/sh
#PBS -N hello-world
#PBS -l select=1:ncpus=4:mem=2gb

pwd
cd $PBS_O_WORKDIR
pwd
echo "Hello, world!"
sleep 600
```

Useful options and environment variables:

`-l ***`
: to request resources.

`-N job_name`
: to set job's name.

`-J 1-n`
: to declare the job is an array job with size `n`.

`-v VARIABLE=value`
: to export environment variables to the job.

`-o ***`, `-e ***`
: to specify the path for the standard output/error stream.
  By default, they are writen to the current working directory where `qsub` was executed,
  i.e., `${PBS_O_WORKDIR}/${PBS_JOBNAME}.o<sequence_number>`

`PBS_JOBID`
: the ID of the job.

`PBS_JOBNAME`
: the name of the job.

`PBS_O_WORKDIR`
: the working directory where `qsub` was executed.

See `man qsub` for more details.


### `qstat`: Check the status of jobs

```sh
% qstat
```

### `qdel`: Delete a job

```sh
% qdel 9
```
