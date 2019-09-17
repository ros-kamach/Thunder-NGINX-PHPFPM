          node('') {
              stage ('Build_Alpine_Thunder_image') {
                      openshiftBuild(namespace: 'jenkins-ci', buildConfig: 'thunder-alpine', showBuildLogs: 'true',  waitTime: '3000000')
              }
              stage('Approve for Deployment') {
                  input message: 'Deploy MYQL than Thunder?',
                  id: 'approval'
              }
              stage ('Deploy_MYSQL') {
                      openshiftDeploy(namespace: 'thunder', deploymentConfig: 'mysql', waitTime: '3000000')
              }
              stage ('Deploy_Thunder') {
                  openshiftDeploy(namespace: 'thunder', deploymentConfig: 'thunder-deployment', waitTime: '3000000')

              }
          }
