pipeline {
    agent { 
        node {
            label 'docker-agent-alpine-default'
            }
            
      }
    triggers {
        pollSCM '*/5 * * * *' //will poll every 5 minutes
        //pollSCM '* * * * *' //will poll once a minutes
    }

    stages {
        stage('PreBuild') {
            steps {
                echo "Configurations.."
                sh 'echo "doing config stuff.."'
                //sh 'apt-get update'
                //sh 'apt-get install python3'
                sh 'python3 -m pip install -r requirements.txt'
            
            }
        }
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                echo "doing build stuff.."
                '''
            }
        }
        stage('PostBuild') {
            steps {
                echo "Organizing.."
                sh '''
                echo "doing organization stuff.."
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing i.e. Binaries.."
                sh '''
                echo "doing test stuff.."
                '''
                sh 'pytest 2>&1 | tee results.txt'
                //stash name: "first-stash", includes: "*"
                
            }
            post {
                always {
                    archiveArtifacts artifacts: 'results.txt', fingerprint: true
                }
            }
        }
        stage('OtherTest') {
            steps {
                echo "Other Testing.."
                sh '''
                echo "doing other test stuff.."
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."
                '''
                
            }
            agent { label 'built-in-node' }
            post {
                success {
                        copyArtifacts projectName: env.JOB_NAME, target: env.BUILD_NUMBER, filter: 'results.txt', fingerprintArtifacts: true, optional: true, selector: [$class: 'SpecificBuildSelector', buildNumber: env.BUILD_NUMBER];
                }
            }
        }
    }
}