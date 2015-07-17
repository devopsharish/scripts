from boto import ec2

c = ec2.connect_to_region('us-east-1')
securitygroups = c.get_all_security_groups()
for sg in securitygroups :
    print('%s' % (sg))
