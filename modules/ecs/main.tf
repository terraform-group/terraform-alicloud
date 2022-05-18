
data "alicloud_images" "images_ds" {
  owners       = "system"
  name_regex   = "^centos_7_5"
  architecture = "x86_64"
  status       = "Available"
  os_type      = "linux"
  # output_file  = "./outputs.json"
}

resource "alicloud_instance" "myecs" {
  availability_zone          = var.region
  security_groups            = [var.secgroup_id]
  instance_type              = var.instance_type
  system_disk_category       = "cloud_efficiency"
  system_disk_name           = "tf_system_disk_name"
  system_disk_description    = "tf_system_disk_description"
  image_id                   = data.alicloud_images.images_ds.images[0].id
  instance_name              = var.instance_name
  vswitch_id                 = var.vsw_id
  internet_max_bandwidth_out = 0
  internet_charge_type       = "PayByTraffic"
  password                   = "root@123"
  user_data = <<-EOF
              #!/bin/bash 
              # until [[ -f /var/lib/cloud/instance/boot-finished ]] ;do
              #    sleep 1
              # done

              yum -y install nginx 
              echo "myserver" >/usr/share/nginx/html/index.html
              systemctl restart nginx 
              EOF
      

  
}