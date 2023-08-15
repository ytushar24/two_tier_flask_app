pipeline {
    agent {label "dev_agent"}
    stages {
        stage("code clone"){
            steps{
                //
                echo "code cloned"
                git url: "https://github.com/ytushar24/two_tier_flask_app.git", branch: "main"
            }
        }
        stage("build and test"){
            steps{
                //git url: "https://github.com/ytushar24/two_tier_flask_app.git"
                echo "building image"
                sh "docker build . -t two_tier_flask-app"
            }
        }
        stage("pushing to dockerhub"){
            steps{
                withCredentials([usernamePassword(credentialsId:"dockerhub", passwordVariable:"dockerhubpass", usernameVariable:"dockerhubuser")]){
                    sh "docker tag two_tier_flask-app ${env.dockerhubuser}/two_tier_flask-app:latest"
                    sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpass}"
                    sh "docker push ${env.dockerHubUser}/two_tier_flask-app:latest"
                }
            }
        }
         stage("deploying"){
            steps{
                //git url: "https://github.com/ytushar24/two_tier_flask_app.git"
                echo "deploying the image"
                sh "docker-compose down && docker-compose up -d --build"
            }
        }
    }
}
