pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                script {
                    sh 'docker compose -f compose.yaml build'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // start container in detached mode
                    sh 'docker compose -f compose.yaml up -d'
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
                script {
                    // wait for a few seconds to ensure the service is up
                    sleep(10)

                    // run the test script to check if url is reachable
                    sh 'chmod +x test_url.sh'
                    sh './test_url.sh'
                }
            }
        }
    }
    post {
        success {
            echo 'Build and tests successful..'
        }
        failure {
            echo 'Build or tests failed.'
        }
        always {
            // stop and remove containers after the test
            sh 'docker compose -f compose.yaml down'
        }
    }
}