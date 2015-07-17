from boto import ec2
 
csv_file = open('./instances.csv','w+')
csv_file.write("%s,%s,%s,%s,%s,%s,%s,%s,%s\n"%("Hostname", "Instance Id", "EIP", "Instance Type", "Instance State", "Private IP", "Operating System", "Availability Zone", "Architecture"))
tagList = []
ec2conn = ec2.connection.EC2Connection()
reservations = ec2conn.get_all_instances()
for res in reservations:
    for instance in res.instances:
         
        if (instance.platform == 'windows'):
            platform = 'Windows'
        else:
            platform = 'Linux'
         
    csv_file.write("%s,%s,%s,%s,%s,%s,%s,%s,%s\n"%(instance.tags['Name'],instance.id,instance.ip_address,instance.instance_type,instance.state,instance.private_ip_address, platform, instance.placement,instance.architecture))
    csv_file.flush()
 
csv_file.close()
