+++
title = "Admin"
menu = "main"
draft = true
+++

## Add a new user

- [Google Form](https://docs.google.com/forms/d/13PUga_MUGX5cuFJ5dUjMC9BC1P1cQN4rohS_g-AQIz8/edit)

1.  Add the user (and his/her mentor) to
    [metal-sokendai](https://groups.google.com/forum/#!forum/metal-sokendai):
    "Manage" => "Invite members"
    ```
    Dear ______,

    Please accept this invitation to create a user account on Metal system.
    Various notifications such as server maintenance and updates will be provided with this mailing list.
    You can also post questions and requests here.

    Best,
    Watal
    ```

1.  Create an account
    ```sh
    # NEWUSER=______
    # useradd -m -g users -s /bin/bash ${NEWUSER}
    # passwd ${NEWUSER}
    ```

1.  Update NIS
    ```sh
    # make -C /var/yp
    # ypbind -c
    # ypcat passwd
    # systemctl restart rpcbind.service
    ```

1.  Configure SSH
    ```sh
    # emacs /home/${NEWUSER}/.ssh/authorized_keys
    # chmod 700 /home/${NEWUSER}/.ssh
    # chmod 600 /home/${NEWUSER}/.ssh/authorized_keys
    # chown -R ${NEWUSER}:users /home/${NEWUSER}/.ssh
    ```

1.  Send an email:
    ```
    Dear ______,
    CC: Prof. ______,

    You have been successfully registered as a user of Metal system.
    Try loggin in to the server with the following command:

    ssh ______@metal.campus.soken.ac.jp

    Best,
    Watal
    ```


## Install softwares

### Linuxbrew

- If the software is available on Linuxbrew, use it.
- `brew` must be executed by a non-root user.


### Others

- Download an archive to `/root/Downloads/`
- Install it with a prefix `/opt/local`
- If the software does not provide any installation method,
  move the whole directory to `/opt/local/Cellar/` with a version number,
  and create symlinks to `/opt/local/bin`, `include`, `lib`, and so on.
