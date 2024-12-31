node {
    parameters {
        string(name: 'Imagetag', defaultValue: '1.0', description: 'this is imagetag')
}
    try {
        stage("Clone Code") {
            cleanWs()
            git url: "https://github.com/khushpardhi/wanderlust.git", branch: "main"
        }

        stage("Login to DockerHub") {
            withCredentials([usernamePassword(credentialsId: "dockerHub", passwordVariable: "dockerHubPass", usernameVariable: "dockerHubUser")]) {
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
            }
        }

         stage("Build Docker Images with Docker Compose") {
            echo "Building Docker images using docker-compose..."
            // Use the image tag parameter in the docker-compose build step
            sh "docker-compose build --build-arg IMAGE_TAG=${params.Imagetag}"
        }
        stage('Approval') {
            steps {
                script {
                    def userInput = input(
                        id: 'userInput', 
                        message: 'Do you want to proceed with deployment?', 
                        parameters: [
                            choice(name: 'push image on dockerhub', choices: ['Yes', 'No'], description: 'can i pull this image on dockerhub')
                        ]
                    )
                    echo "User chose: ${userInput}"
                }
            }
        }

        stage("Push Docker Images to DockerHub") {
            def DOCKER_IMAGES = [
                "khushpardhi/backend:${params.Imagetag}",
                "khushpardhi/frontend:${params.Imagetag}"
            ]
            for (image in DOCKER_IMAGES) {
                echo "Pushing Docker image: ${image}"
                sh "docker push ${image}"
            }
        }
    } catch (Exception e) {
        currentBuild.result = "FAILURE"
        throw e
    }
}
