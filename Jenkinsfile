pipeline {
        agent {
          label 'jdk'       
        }
        
        tools {
        maven 'Maven3.6'
        }

        stages{
            stage('Build'){
                steps {
                    echo "project is building"
                    sh "printenv"
                    sh "mvn clean package"
                }
            }
        }
}
