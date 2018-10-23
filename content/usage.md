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

## Notes

- The server is accessible **only from the ESB campus LAN**.
- No graphical user interface (GUI) is available;
  all the operation has to be carried out with a **command-line interface (CLI)**.
- It is recommended to use
  [**rsync**](https://www.google.co.jp/search?q=rsync+ssh)
  to transfer your files between your local computer and the server.
- Your home directory `~/` on the head node is shared with the compute nodes.
  You don't have to care about data transfer between nodes within the system.
- **100GB** disk space is allocated for each user.
  The size may be changed in the future.
- **Do NOT execute programs directly on the head node**.
  All the computational tasks must be managed by the PBS job scheduler
  [(see below)](#pbs-job-scheduler).
- Check [the list of available softwares]({{< relref "software.md" >}}).
  You can install additional softwares into your home directory,
  or ask the administrator for system-wide installation.


## How to setup SSH keys

1.  Execute the following command on your local computer:
    ```
    ssh-keygen -t ed25519 -N ''
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
    ls -al ~/.ssh
    # drwx------ 11 winston staff 374 Apr 04 10:00 ./
    # -rw-------  1 winston staff 399 Apr 04 10:00 id_ed25519
    # -rw-r--r--  1 winston staff  92 Apr 04 10:00 id_ed25519.pub
    ```
    The permissions of `~/.ssh` and `~/.ssh/id_ed25519` must be `700` and `600`, respectively.

1.  Copy and paste the whole content of the public key (**NOT** private key) to the online registration form.
    For example, `pbcopy` command is useful on macOS:
    ```sh
    cat ~/.ssh/id_ed25519.pub | pbcopy
    ```

1.  After the administrator adds your public key to your `~/.ssh/authorized_keys` on the server,
    you can login from the local computer with the private key `~/.ssh/id_ed25519`.
    ```
    ssh your_username_on_metal@metal.campus.soken.ac.jp
    ```

1.  (Optional) Create `~/.ssh/config` on your local computer:
    ```
    Host metal
      Hostname metal.campus.soken.ac.jp
      User your_username_on_metal
    ```
    Then you can login with the shorter command: `ssh metal`.


## PBS job scheduler

[Documentation](https://www.google.co.jp/search?q=pbs+professional+14)

### Check ths system status

```
pbsnodes -aSj
```

### `qsub`: Submit a job

You can submit a job from command line or by using scripts:
```sh
qsub -N jobname -j oe -- /path/to/your/executable [args...]
    # or
qsub hello.sh
```

An example job script `hello.sh`:
```sh
#!/bin/sh
#PBS -N hello-world
#PBS -j oe
#PBS -l select=1:ncpus=1:mem=1gb

pwd
cd $PBS_O_WORKDIR
pwd
echo "Hello, world!"
sleep 60
```

An example of an array job `array.sh`:
```sh
#!/bin/sh
#PBS -N array-ms
#PBS -j oe
#PBS -l select=1:ncpus=1:mem=1gb
#PBS -J 0-3

cd $PBS_O_WORKDIR
param_range=($(seq 5.0 0.5 6.5))  # (5.0, 5.5, 6.0, 6.5)
theta=${param_range[@]:${PBS_ARRAY_INDEX}:1}
ms 4 2 -t $theta
```

An equivalent job script in Python:
```py
#!/usr/bin/env python3
#PBS -N array-ms-py
#PBS -j oe
#PBS -l select=1:ncpus=1:mem=1gb
#PBS -J 0-3
import os
import subprocess
import numpy as np

os.chdir(os.getenv('PBS_O_WORKDIR', '.'))
array_index = int(os.getenv('PBS_ARRAY_INDEX', '0'))
param_range = np.linspace(5.0, 6.5, 4)  # [5.0, 5.5, 6.0, 6.5]
theta = param_range[array_index]
cmd = 'ms 4 2 -t {}'.format(theta)
proc = subprocess.run(cmd.split(), stdout=subprocess.PIPE)
print(proc.stdout.decode(), end='')
```

Useful options and environment variables:

`-N job_name`
: to set job's name.

`-o ***`, `-e ***`
: to specify the path for the standard output/error stream.
  By default, they are writen to the current working directory where `qsub` was executed,
  i.e., `${PBS_O_WORKDIR}/${PBS_JOBNAME}.o<sequence_number>`

`-j oe`
: to merge the standard error stream into the standard output stream.
  It is equivalent to `2>&1` in shell redirection.

`-J 0-3`
: to declare the job is an array job (with size 4 in this example).
  A current index (`0`, `1`, ...) can be obtained via `PBS_ARRAY_INDEX`.

`-l ***`
: to request resources.

`-v VARIABLE=value`
: to export environment variables to the job.

`PBS_JOBID`
: the ID of the job.

`PBS_JOBNAME`
: the name of the job.

`PBS_O_WORKDIR`
: the working directory where `qsub` was called.
  By default, stdout/stderr are copied to here,
  although jobs are executed in `$HOME`.
  You may want to `cd $PBS_O_WORKDIR` in many cases.

See `man qsub` for more details.


### `qstat`: Check the status of jobs

```sh
# List
qstat -x

# See the detail of a job
qstat -fx <PBS_JOBID>
```

### `qdel`: Delete a job

```sh
qdel <PBS_JOBID>
```
