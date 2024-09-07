pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Ameenuddin612/Java-web-calci.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Package') {
            steps {
                sh 'zip -r my-app.zip target/your-app.war appspec.yml scripts/'
            }
        }

        stage('Upload to S3') {
            steps {
                withAWS(credentials: 'your-aws-credentials-id', region: 'us-west-2') {
                    s3Upload file: 'my-app.zip', bucket: 'my-s3-bucket', path: 'my-app.zip'
                }
            }
        }

        stage('Deploy to AWS CodeDeploy') {
            steps {
                withAWS(credentials: 'your-aws-credentials-id', region: 'us-west-2') {
                    awsCodeDeploy application: 'MyJavaApp', deploymentGroup: 'MyJavaApp-DeploymentGroup', 
                    deploymentConfig: 'CodeDeployDefault.OneAtATime', 
                    s3Bucket: 'my-s3-bucket', s3Key: 'my-app.zip'
                }
            }
        }
    }
}
