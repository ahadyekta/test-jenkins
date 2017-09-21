pipeline {
    agent any
    stages{
        stage('Initialize'){
             steps {script {
                 script {
                echo 'Initializing...'
                def node = tool name: 'node-8', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                env.PATH = "${node}/bin:${env.PATH}"

                sh "node -v"
                 }
             }
        }

        stage('Checkout') {
            steps {
                script {
                echo 'Getting source code...'
                checkout scm
                }
            }
        }

        stage('Build') {
            steps {
                script {
                echo 'Building dependencies...'
                sh 'npm i'
                }
            }
        }

        stage('Stop Server') {
            steps {
                script {
                echo 'Stopping old process to run new process...'
                sh './node_modules/.bin/pm2 stop app.js'
                }
            }
            
        }

        stage('Start Server') {
            steps {
                script {
                echo 'starting server on port 4000...'
                sh './node_modules/.bin/pm2 start app.js'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                echo 'Testing...'
                sh './node_modules/mocha/bin/mocha'
                }
            }
        }
    }
    
}