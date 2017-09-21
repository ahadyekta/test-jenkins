node {
   
   
                sh "echo 'Initializing...'"
                def node = tool name: 'node-8', type: 'jenkins.plugins.nodejs.tools.NodeJSInstallation'
                env.PATH = "${node}/bin:${env.PATH}"

                sh "node -v"
            
   
    
}