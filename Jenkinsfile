pipeline {
    agent any

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/krittika019/telemetry-core.git'
            }
        }

        stage('Telemetry Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'cat telemetry.conf'
                        sh 'mkdir -p build && cp telemetry.conf build/ && echo "Telemetry build complete" > build/build-info.txt'
                    } else {
                        bat 'type telemetry.conf'
                        bat 'if not exist build mkdir build && copy /Y telemetry.conf build\\ && echo Telemetry build complete > build\\build-info.txt'
                    }
                }
            }
        }

        stage('Deploy Artifact') {
            steps {
                archiveArtifacts artifacts: 'build/**', fingerprint: true
                echo 'Artifact deployed successfully'
            }
        }
    }
}
