# instance-metadata


## About The Project

This project is being written in shell script and it is used to get all the metadata of AWS EC2 instance in json format. It also shows all the available ec2 metadata categories and also their values. The final output is the metadata of ec2 instance in json format which will be printed on the console and also it outputs the result in outputs.json file.


## Getting Started

### Prerequisites

1. Since the code is written in shell script, you need linux machine to run it.
2. you need to login to AWS EC2 Instance either via ssh using aws cli or using putty or from aws console via connect option (where it ssh into ec2 instance via browser)

### Installation

1. Login to the aws ec2 instance using the above method mentioned in the prerequisites.
2. Clone the repo
   ```sh
   git clone https://github.com/naveen-realm/instance-metadata.git
   ```
3. Switch to root user to install some packages if not done already
   ```sh
   sudo su
   ```
4. Install packages like curl, jq if not installed already
   i. If you are using redhat or centos distribution of linux then use the below command:
     ```sh
     yum install curl
     ```
   ii. Once the installation is complete, verify it by typing curl in your terminal: 
     ```sh
     curl
     ```
   iii. For installation of jq:
     ```sh
     yum install jq
     ```
   iv. Once the installation is complete, verify it in your terminal:
     ```sh
     jq --version
     ```
    v. If you are using debian distribution then instead of yum use apt-get as shown below:
     ```sh
     apt-get install curl
     apt-get install jq
     ```
Note: If git is not installed use 'yum install git' for redhat or centos distribution. For debian or ubuntu, use 'apt-get install'. Cloning the repository is not needed, you can copy the file metadata-finder.sh and execute it too.
 
 
## Usage

 1. After cloning the git reposiotry, move into the folder using cd:
    ```sh
    cd instance-metadata
    ```
 2. Make the file executable using the below command:
    ```sh
    chmod +x metadata-finder.sh
    ```
 3. Execute the file:
    ```sh
    ./metadata-finder.sh
    ```
  4. If you want to debug an issue then use the below command (optional)
     ```sh
     sh -x metadata-finder.sh
     ```
