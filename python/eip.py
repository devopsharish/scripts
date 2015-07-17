from boto import ec2

c = ec2.connect_to_region('us-east-1')
addresses = c.get_all_addresses()
for addr in addresses:
    print('%s' % (addr.public_ip))
