echo "This script will deploy the base development stack, and create image for this project"
echo "Please not that this script requires SUDO"

echo "Please input stack name for julia/mongo machines: "
read stack

if [ -z "$stack" ]
then
echo "No Stack defined.. exiting"
exit
fi

## Deploy image with full development stack
sudo docker pull antonioloureiro/julia_dev
sudo docker pull mongo

##Access "Docker" directory and execute:
sudo docker-compose -p $stack up -d 
