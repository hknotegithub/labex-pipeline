pipeline {
        agent any
        
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
            stage('Deploy'){
			steps {
				ansiblePlaybook(
					playbook: "${env.WORKSPACE}/playbook.yml",
					inventory: "${env.WORKSPACE}/hosts",
					credentialsId: 'liuwenjieID'
				)		
	
			}
		}
        }
}
