# .ansible

workstation bootstrapping. to be rebased onto a blank kde neon install.

tested with neon 5.12.x, uses ansible 2.5.x via PPA so human-readable output via callback works.
default verbosity changed to '-vv' so the files:line of the currently run task is shown.

## make ssh work, so ansible behaves
    sudo bash -c "echo 'sjas ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/sjas
    sudo apt install openssh-server -y
    ssh-keygen -trsa -b4096 -N '' -f ~/.ssh/id_rsa
    ssh-copy-id localhost  ## enter password here when promted
    
## bootstrap ansible itself
    sudo apt install software-properties-common -y
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt update
    sudo apt install ansible -y
    ANSIBLETEMPROOT=~/etc
    mkdir -p $ANSIBLETEMPROOT
    cd $ANSIBLETEMPROOT
    git clone https://github.com/sjas/.ansible
    cat << EOF > ~/.ansible.cfg
    [defaults]
    inventory = $ANSIBLETEMPROOT/.ansible/hosts
    stdout_callback = debug
    verbosity = 2
    EOF
    cd .ansible
    
## run ansible to get the workstation up and running

    cd ~/etc/.ansible
    ansible-playbook neon.yml