USER=$1
PUBKEY=$2
GROUP=$3

if [ -n $USER ];
then
useradd $USER
echo "Added user $USER";
else
echo "No user provided";
exit 2
fi

if [ -n $PUBKEY ];
then
mkdir /home/$USER/.ssh
echo "Created /home/$USER/.ssh directory";
chown $USER:$USER /home/$USER/.ssh
echo "Setting proper owner of .ssh directory";
touch /home/$USER/.ssh/authorized_keys
echo "created authorized keys file";
chown $USER:$USER /home/$USER/.ssh/authorized_keys
echo "Changed owner of authorized keys file";
cat $2 > /home/$USER/.ssh/authorized_keys
echo "Wrote public key to authorized_keys";
ssh-keygen -l -f /home/$USER/.ssh/authorized_keys
echo "Verified authorized_keys file";
else
echo "No public key file provided"
fi

if [ -n $GROUP ];
then
usermod -a -G $GROUP $USER
echo "Added $USER to $GROUP";
else
echo "Not adding user to a group";
fi
