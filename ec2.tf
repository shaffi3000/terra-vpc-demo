resource "aws_instance" "web1" {
    ami = "ami-038f1ca1bd58a5790"
    instance_type = "t2.micro"

    #vpc 

    subnet_id = "${aws_subnet.prod-subnet-public-1.id}"

    #SG

    vpc_security_group_ids = [ "${aws_security_group.ssh-allowed.id}"]

    #public ssh key

    key_name = "docker-demo"

    user_data = "${file("install_http.sh")}"

    tags = {
        "Name" = "docker-terra-demo"
    }
  
}