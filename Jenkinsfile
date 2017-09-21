node {
   
        stage('Initialize'){
            
                sh "echo 'Initializing...'"
                def node = tool name: 'node-8', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                env.PATH = "${node}/bin:${env.PATH}"

                sh "node -v"
            
        }

        stage('Checkout') {
           
                sh "echo 'Getting source code...'"
                checkout scm
            
        }

        stage('Build') {
           
                sh "echo 'Building dependencies...'"
                sh 'npm i'
            }
        }

        stage('Stop Server') {
           
                sh "echo 'Stopping old process to run new process...'"
                sh './node_modules/.bin/pm2 stop app.js'
            
            
        }

        stage('Start Server') {
           
                sh "echo 'starting server on port 4000...'"
                sh './node_modules/.bin/pm2 start app.js'
          
        }

        stage('Test') {
          
                sh "echo 'Testing...'"
                sh './node_modules/mocha/bin/mocha'
            
        }
    
    
}