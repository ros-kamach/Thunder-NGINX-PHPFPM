          node('') {
              stage ('Build_Alpine_Thunder_image') {
                      openshiftBuild(namespace: '${JENKINS_PROJECT_NAME}', buildConfig: 'thunder-alpine', showBuildLogs: 'true',  waitTime: '3000000')
              }
              stage('Approve for Deployment') {
                  input message: 'Deploy MYQL than Thunder?',
                  id: 'approval'
              }
              stage ('Deploy_MYSQL') {
                      openshiftDeploy(namespace: '${THUNDER_PROJECT_NAME}', deploymentConfig: 'mysql', waitTime: '3000000')
              }
              stage ('Deploy_Thunder') {
                  openshiftDeploy(namespace: '${THUNDER_PROJECT_NAME}', deploymentConfig: 'thunder-deployment', waitTime: '3000000')

              }
          }
