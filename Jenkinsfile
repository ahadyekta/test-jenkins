pipeline {
    agent any
    stages{
        stage('Initialize'){
            echo 'Initializing...'
            def node = tool name: 'node-8', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
            env.PATH = "${node}/bin:${env.PATH}"

            sh "node -v"

            // set environment variables
            env.VARIABLE_1="10"
            env.VARIABLE_2="7"
        }

        stage('Checkout') {
            echo 'Getting source code...'
            checkout scm
        }

        stage('Build') {
            echo 'Building dependencies...'
            sh 'npm i'
        }

        stage('Stop Server') {
            echo 'Stopping old process to run new process...'
            sh './node_modules/.bin/pm2 stop app.js'
        }

        stage('Start Server') {
            echo 'starting server on port 4000...'
            sh './node_modules/.bin/pm2 start app.js'
        }

        stage('Test') {
            echo 'Testing...'
            sh './node_modules/mocha/bin/mocha'
        }
    }
    
}