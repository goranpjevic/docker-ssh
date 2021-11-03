# docker ssh

the `script.sh` file generates a dockerfile for [alpine
linux](https://en.wikipedia.org/wiki/Alpine_Linux), creates a container, and
connects to it via *ssh*.

the dockerfile installs [openssh](https://en.wikipedia.org/wiki/OpenSSH) and
starts an *ssh* server.

## usage

* install [docker](https://www.docker.com)
* generate an rsa key with the command:

```sh
ssh-keygen -t RSA
```

the public key must be located in `~/.ssh/id_rsa.pub`

run the script file with the command:

```sh
bash script.sh
```
