# unix-dotfiles
My dotfiles for unix-like systems

# Ansible Setup
Needs at least ansible 2.10

``` shell
ansible-galaxy collection install -r requirements.yml
```
# Run Playbooks
``` shell
ansible-playbook local.yml --ask-become-pass
```
