# Managing Ansible SSH Keys with Conjur Enterprise

Instead of storing SSH private keys on your Ansible controller, you can store
them in Conjur Enterprise. This makes it easy to control access to them using
Conjur MAML policy code, to automatically rotate them, and to audit secret
access.

## Running the demo

In order to run through this demo yourself, you will need a few dependencies:

1. A Conjur Enterprise image for Docker. Contact CyberArk to get access to this.
2. [Docker Community Edition][docker]
3. A terminal application
4. git
5. A machine that you have SSH access to, with its SSH port forwarded to
   `localhost:2222` and a python interpreter installed. (We provide a
   Vagrantfile if you want to use Vagrant to create a virtual machine and set up
   the port forwarding automatically.)

Once your dependencies are installed, use git to clone this repository:

```sh-session
$ git clone git@github.com:conjur/ansible-ssh-demo.git
$ cd ansible-ssh-demo
```

If using Vagrant:
```sh-session
$ vagrant up
$ vagrant ssh
# sudo apt-get update && sudo apt-get install python
```

Then run through the scripts in order:

```sh-session
$ ./0_start
$ ./1_ssh_using_plaintext_secret
$ ./2_ansible_using_plaintext_secret
$ ./3_load_policy
$ ./4_vault_ssh_private_key
$ ./5_ssh_using_summon
$ ./6_ansible_using_summon
```

During steps 1 and 5 (the ssh steps), you can run commands on your remote host.
When you're finished, type `exit`.

Steps 3 and 4 will print links to your local Conjur Enterprise UI, helping you
visualize the state of the system.

### Using Conjur to rotate keys

This demo also shows automatic rotation of SSH keys.

Note that rotation does not happen immediately, it takes some time to register
the new key, so it isn't ideal for snappy demonstration purposes. But the
capability is there:

```sh-session
$ ./7_setup_rotation
$ ./8_rotate_now
```
