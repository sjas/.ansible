# .ansible

workstation bootstrapping, rebase this onto a blank kde neon install

- tested with neon 5.16.x on 18.04
- uses newest ansible from PPA instead of distro upstream, so human-readable output via callback works
- default verbosity changed to '-vv' so the FILE:LINE position of the currently run task is shown
- ansible-lint and yamllint are run on every commit, use `gc` (without a message so no actual commit takes place) after deploy to see wether they find something

## bootstrapping

### make ssh work, so ansible behaves
    sudo bash -c "echo 'sjas ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/sjas"
    sudo apt install openssh-server -y
    ssh-keygen -trsa -b4096 -N '' -f ~/.ssh/id_rsa
    ssh-copy-id localhost  ## enter password here when promted
    mkdir -p ~/.ssh/controlmasters

### setup ansible itself
    sudo apt install software-properties-common -y
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt update
    sudo apt install ansible -y
    sudo apt install git -y
    ANSIBLETEMPROOT=~/etc
    mkdir -p $ANSIBLETEMPROOT
    cd $ANSIBLETEMPROOT
    git clone https://github.com/sjas/.ansible
    cat << EOF > ~/.ansible.cfg
    [defaults]
    inventory = $ANSIBLETEMPROOT/.ansible/hosts
    #stdout_callback = debug
    stdout_callback = yaml
    verbosity = 2
    roles_path = /etc/ansible/roles:./
    [ssh_connection]
    ssh_args = -o controlmaster=auto -o controlpersist=60s -o controlpath=~/.ssh/controlmasters/%r@%h:%p
    pipelining = yes
    [diff]
    always = yes
    context = 4
    EOF
    cd .ansible

## run ansible to get the workstation up and running
    cd ~/etc/.ansible
    ansible-playbook neon.yml

## post tasks

    # make your new settings known to your current shell
    . ~/.bashrc
    # logout/login to KDE
    # otherwise your GUI changes will not be applied

## some useful oneliners for discerning settings' locations

    ## run in ~/.config
    find . -type f -ls | grep .git -v > asdf1; read; find . -type f -ls | grep .git -v > asdf2; diff asdf{1,2} | awk 'NF>1 {print $NF}' | sort -u | awk 'NF>0'| grep -ve 'asdf[12]' | sed -e 's/^\.\///' ; rm asdf{1,2}

    strace systemsettings5 |& grep ^stat | grep -v -e ENOENT -e /etc/localtime -e st_mode=S_IFDIR -e /run/user/1000 -e /usr/lib/x86_64- | cut -c7- | sed -e 's/"/ /' | awk '{print $1}'

    ## first: cd ~/.config; git init; git add .; git commit -m init
    watch -n1 -d 'git diff HEAD | grep -e diff -e \+\+\+ -e^\+ | grep --color -e$ -ediff\ \-\-.\* | wc -l; echo; git status'

## todo

currently a lot of hardcoded path's are used, most revolves around `/home/sjas`. possibly this will not get cleaned up in the foreseeable future, use `sed`/`grep` to fix this for yourself.
