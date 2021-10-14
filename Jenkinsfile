pipeline {
    agent any
	 environment {
        AWS_ROLE = "Terraformrole"
    }
   
    parameters {
        choice(name: 'env', choices: 'DEV_PRACTICE\nTEST_PRACTICE', description: 'Select Environment')
        choice(name: 'action', choices: 'init\nplan\napply\nplan-destroy\ndestroy', description: 'Select Action')
    }  
	
    stages {
	 stage('git') {
		 
	when {
    expression { 
        params.action == 'apply'
        
    }
}
            steps {
                  git 'https://github.com/mani5a3/game-of-life.git'
                 }
                 }// stage git
     stage('build'){
		when {
    expression { 
        params.action == 'apply'
        
    }
} 
            steps  {
                     sh 'mvn package'
                   }
	     
     }//stage build
	    
	 stage('SonarQube analysis'){
	when {
    expression { 
        params.action == 'apply'
        
    }
}
       steps {
	     
          withSonarQubeEnv('sonarqube') {
  
             sh "/home/softwares/sonar-scanner-3.3.0.1492-linux/bin/sonar-scanner -Dproject.settings=sonar-project.properties"
               }
             }
          }  //stage SonarQube analysis 
	    
		    stage('jfrog'){
		when {
    expression { 
        params.action == 'apply'
        
    }
}
            
            steps{
                script{
                    def SERVER_ID = 'artifactory'
                    def server = Artifactory.server SERVER_ID
                    
                    def uploadSpec = """{
                        "files": [{
                                    "pattern": "**/*.war",
                                    "target": "example-repo-local"
                        }]
                    }"""
                    
                    server.upload(uploadSpec)
                }
            }
        }//stage jfrog
	    
	      stage('IAC') {
            environment {
                LAYER = "${params.env}"
                INFRA_ACTION = "${params.action}"
            }
      
		 steps {

                script {
                    sh 'chmod +x infra.sh'
                    if (params.env == 'DEV_PRACTICE')
                        sh 'AWS_ACCOUNT_ID=21313213 ./infra.sh'
                }
            }
		
        } // stage terraform
	    
stage('Deploy') {
	
	when {
    expression { 
        params.action == 'apply'
        
    }
}
    steps{
sh "chmod 777 ec2.py"
sh "chmod 777 ec2.ini" 
sh "./ec2.py --list --profile default --refresh-cache"
sh "ansible -i ec2.py -u ubuntu tag_Env_DEV_EC2 -m ping"
sh "ansible-playbook -i ec2.py -u ubuntu   tomcat.yml"
} 
}//stage deploy    
	    

}//stages   
 
}//pipeline   
