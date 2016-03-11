# Summary
Docker image file to create an openSUSE Tumbleweed container for YaST2
development

# Building the image
Build it like this (or something similar)

 docker build -t hwoarang/docker-yast2-devel .

# Creating a container

 docker run -i -t -e 'USER=markos' --name "my-yast2-devel" hwoarang/docker-yast2-devel
