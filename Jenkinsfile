pipeline {				//indicate the job is written in Declarative Pipeline
    agent any				//agent specifies where the pipeline will execute. 
    options {
        buildDiscarder(logRotator(numToKeepStr: '5', artifactNumToKeepStr: '5'))
        timestamps()
    }
    stages {
        stage ("Build_Alpine_Thunder_image") {		//an arbitrary stage name
            steps {
                build 'alpine_thunder'	//this is where we specify which job to invoke.
            }
        }
        stage ('Deploy To Production WEB Server'){
        input{
                message "Do you want to proceed for production deployment?"
        }
            steps {
                build 'prod_deployment'	//this is where we specify which job to invoke.
            }
        }
    }
}
