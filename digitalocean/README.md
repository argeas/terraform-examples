# Terraform Setup

## 1 - Setup terraform locally   
download terraform,     
create terraform dir:  
```mkdir -p ~/opt/terraform/bin```  
unzip the download:  
```unzip ~/Downloads/terraform_0.1.1_darwin_amd64.zip -d ~/opt/terraform/bin```  
add to your bashrc:  
```export PATH=$PATH:~/opt/terraform/bin```  
reload bashrc:  
```. ~/.bashrc```  
run terraform to verify setup:  
```terraform```


## 2 - How to run terraform  ( run always the terraform commands from where you .tf files live)
Once you have setup all your files (also files from section 2 below),   
go to your workspace folder and run:  
```terraform init -backend-config=backend.config```  
If all goes well then run:  
```terraform plan```  
and then to execute the plan and create a droplet:  
```terraform apply```  
To destroy a droplet:  
```terraform destroy```     

## 3 - Create a new terraform project
To create a terraform plan first create a seperate workspace folder.
e.g look at mpe-droplet folder

In there define your provider.tf file and mpe-create.tf file that are needed for terraform to connect to digital ocean 

## 4- Spaces terraform state folder
When terraform runs it creates a terraform.tfstate file.
It is good practice to save this file somewhere such as an object storage space so it can be retrieved remotely from droplets and be used.

## 5 - Files required when running terraform locally 
It is a good practice to seperate variable and configuration initialisation into their own files so they are not explicitly defined into the terraform provider files. 

These file are untracked in this repo hence you have to create them manually in your own machine. 

The files required are the following: 

**backend.config**

Add in backend.config the following:

```
bucket = "bm-web-content" # the name of the DO space
access_key = "THE DO SPACES ACCESS KEY"
secret_key = "THE DO SPACES SECRET KEY"
```

**terraform.tfvars**

Add in terraform.tfvars the following:

```
# ADD vars here that you want your env to have on droplet creation.

do_token="DO TOKEN TO CONNECT TO THE DROPLET CREATION API, key must have write access"
pub_key="~/.ssh/id_rsa.pub"
pvt_key="~/.ssh/id_rsa"
bucket="bm-web-content" # spaces name on DO
do_spaces_key="THE DO SPACES ACCESS KEY"
do_spaces_secret="THE DO SPACES SECRET KEY"
ssh_fingerprint="THE PUBLIC KEY FINGER PRINT OF YOUR LOCAL MACHINE" 
```
to get the finger print run:    
```ssh-keygen -E md5 -lf ~/.ssh/id_rsa.pub | awk '{print $2}'```