+++
title = "Admin"
menu = "main"
draft = true
+++

## Add a new user

- [Google Form](https://docs.google.com/forms/d/13PUga_MUGX5cuFJ5dUjMC9BC1P1cQN4rohS_g-AQIz8/edit)

1.  Create an account
    ```sh
    # NEWUSER=______
    # useradd -m -g users -s /bin/bash ${NEWUSER}
    # passwd ${NEWUSER}
    ```

1.  Update NIS
    ```sh
    # systemctl rpcbind restart
    # make -C /var/yp
    # ypbind -c
    # ypcat passwd
    ```

1.  Configure SSH
    ```sh
    # mkdir /home/${NEWUSER}/.ssh
    # emacs /home/${NEWUSER}/.ssh/authorized_keys
    # chmod 700 ${NEWUSER}/.ssh
    # chmod 600 ${NEWUSER}/.ssh/authorized_keys
    # chown -R ${NEWUSER}:users .ssh
    ```

1.  Send an email to the new user
    ```nohighlight
    Dear ______,

    Your account is ready.
    Try loggin in to the server with the following command:

    ssh ______@metal.campus.soken.ac.jp

    Best,
    Watal
    ```
