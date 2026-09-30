pipeline {
    agent any

    options {
        timestamps()
        timeout(time: 30, unit: 'MINUTES')
    }

    environment {
        VENV = "${WORKSPACE}/venv"
    }

    stages {
        stage('Setup Python Environment') {
            steps {
                sh '''
                    python3 -m venv ${VENV}
                    . ${VENV}/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
                    sh '''
                        . ${VENV}/bin/activate
                        robot -d results -v HEADLESS:True tests
                    '''
                }
            }
        }
    }

    post {
        always {
            robot outputPath: 'results'
            archiveArtifacts artifacts: 'results/**', allowEmptyArchive: true
        }
    }
}