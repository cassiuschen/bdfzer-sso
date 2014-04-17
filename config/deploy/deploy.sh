cp puma /etc/init.d
chmod +x /etc/init.d/puma

# Make it start at boot time.
update-rc.d -f puma defaults

# Copy the Puma runner to an accessible location
cp run-puma /usr/local/bin
chmod +x /usr/local/bin/run-puma

# Create an empty configuration file
touch /etc/puma.conf
