# .ansible
workstation bootstrapping. to be rebased onto a blank kde neon install.

## make ssh work, so ansible behaves
    apt install openssh-server -y
    ssh-keygen -trsa -b4096 -N '' -f ~/.ssh/id_rsa
    ssh-copy-id localhost  ## enter password here when promted
    
## bootstrap ansible itself
    ANSIBLETEMPROOT=~/etc/
    mkdir -p $ANSIBLETEMPROOT
    cd $ANSIBLETEMPROOT
    git clone https://github.com/sjas/.ansible
    cat << EOF > ~/.ansible.cfg
    [defaults]
    inventory      = $ANSIBLETEMPROOT/.ansible/hosts
    EOF
    cd .ansible
    
## run ansible to get the workstation up and running

FIXME
