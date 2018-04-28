# .ansible
workstation bootstrapping. to be rebased onto a blank kde neon install.

## make ssh work, so ansible behaves
    apt install openssh-server -y
    ssh-keygen -trsa -b4096 -N '' -f ~/.ssh/id_rsa
    ssh-copy-id localhost  ## enter password here when promted
    
## bootstrap ansible itself
    ANSIBLEROOT=~/etc/ansible
    mkdir -p $ANSIBLEROOT
    cat << EOF > ~/.ansible.cfg
    [defaults]
    inventory      = $ANSIBLEROOT/hosts
    EOF
    cat << EOF > $ANSIBLEROOT/hosts
    localhost
    EOF
    sudo apt install ansible -y
    cd $ANSIBLEROOT
    git clone https://github.com/sjas/.ansible
    
## run ansible to get the workstation up and running

FIXME
