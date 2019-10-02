echo "This script will deploy the base development stack, and create image for this project. This script will require you SUDO password"

echo "Please input stack name for julia/mongo machines: "
read stack

if [ -z "$stack" ]; then
echo "No Stack defined.. exiting"; exit
fi

#generates a random port
port_number_prefix=$(shuf -i 10-100  -n 1)

#check if port is open
open_port=$(eval nc -w 2 -v 127.0.0.1 ${port_number_prefix}88 </dev/null; echo $?)

if [ "$open_port" -eq "0" ]; then
echo "Bad luck.. this port ${port_number_prefix}88 is already in use. Pleae execute the script again"; exit
fi

#creates new file based on template
cp -f docker-compose.yml.template docker-compose.yml

#replace specific port and stack name
sed -i "s/\[PORT\]/$port_number_prefix/g" docker-compose.yml
sed -i "s/\[NAME\]/$stack/g" docker-compose.yml

## Deploy image with full development stack
sudo docker pull antonioloureiro/julia_dev

##Access "Docker" directory and execute:
sudo docker-compose -p $stack up -d

