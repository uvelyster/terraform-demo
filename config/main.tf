provider  "aws" {
  region = "ap-northeast-2" 
}

resource  "aws_instance" "example"  {
   ami            =  "ami-0f3a440bbcff3d043"
   instance_type  =  "t2.micro"

   user_data	  = <<-EOF
                    #!/bin/bash
                    echo "Hello, World" > index.html
                    nohup busybox httpd -f -p 8080 &
                    EOF

   user_data_replace_on_chage = true

   tags  =  {
     Name  =  "terraform-example"
   }
}
