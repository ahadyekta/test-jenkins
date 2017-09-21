pipeline {
    agent any
    stages{
        stage('Initialize'){
             steps {
                sh "echo 'Initializing...'"
                def node = tool name: 'node-8', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                env.PATH = "${node}/bin:${env.PATH}"

                sh "node -v"
             }
        }

        stage('Checkout') {
            steps {
                sh "echo 'Getting source code...'"
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh "echo 'Building dependencies...'"
                sh 'npm i'
            }
        }

        stage('Stop Server') {
            steps {
                sh "echo 'Stopping old process to run new process...'"
                sh './node_modules/.bin/pm2 stop app.js'
            }
            
        }

        stage('Start Server') {
            steps {
                sh "echo 'starting server on port 4000...'"
                sh './node_modules/.bin/pm2 start app.js'
            }
        }

        stage('Test') {
            steps {
                sh "echo 'Testing...'"
                sh './node_modules/mocha/bin/mocha'
            }
        }
    }
    
}