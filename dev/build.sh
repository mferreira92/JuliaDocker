echo "This script will deploy the base development stack, and create image for this project. \nPlease not that this script requires SUDO"

echo "Please input stack name for julia/mongo machines: "
read stack

if [ -z "$stack" ]; then
echo "No Stack defined.. exiting"; exit
fi

#generates a random port
echo "Please unput a two number prefix for ports. (10-99)"
read port_number_prefix

if [ -z "$port_number_prefix" ]; then
echo "No port prefix defined.. exiting"; exit
fi

#check if port is open
open_port=$(eval nc -w 2 -v 127.0.0.1 ${port_number_prefix}88 </dev/null; echo $?)

if [ "$open_port" -eq "0" ]; then
echo "Bad luck.. this port ${port_number_prefix}88 is already in use. Pleae execute the script again"; exit
fi

## Deploy image with full development stack
sudo docker pull antonioloureiro/julia_dev

##Access "Docker" directory and execute:
sudo PORT_PREFIX=$port_number_prefix STACK=$stack docker-compose -p $stack up -d

echo "Machine is UP. Port info:"
echo $(eval sudo docker port ${stack}_dev)
sleep 5
echo "Jupyter session ID":
echo $(eval sudo docker exec -it ${stack}_dev jupyter notebook list)
