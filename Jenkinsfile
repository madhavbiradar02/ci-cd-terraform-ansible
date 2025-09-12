pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/madhavbiradar02/ci-cd-terraform-ansible.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'docker build -t myapp -f docker/Dockerfile .'
                sh 'docker run --rm myapp npm test'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds',
                  usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh 'docker tag myapp $USER/myapp:latest'
                    sh 'docker push $USER/myapp:latest'
                }
            }
        }

        stage('Provision Infra with Terraform') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                    sh 'terraform apply -auto-approve'
                }
            }
        }

        stage('Configure with Ansible') {
            steps {
                dir('ansible') {
                    sh 'ansible-playbook -i inventory.ini playbook.yml'
                }
            }
        }
    }
}