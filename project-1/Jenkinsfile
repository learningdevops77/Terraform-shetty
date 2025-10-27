pipeline{
    parameters {
        choice = (name: 'terraformAction' choices: ['apply','destroy'], description: 'choose your terraform action to perform'
        )
    }

    envirnoment{
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECREATE_ACCESS_KEY_ID = credentials('AWS_SECREATE_ACCESS_KEY_ID')

    }

    Agent any

    stages{

        stage('checkout') {
            step {
                script{
                    dir('terraform')
                    {
                        git branch: main,url: 'https://github.com/learningdevops77/Terraform-shetty.git'
                    }
                }
            }

        }

        stage('Plan'){
            step{
                sh 'pwd; cd '
            }
        }

    }



    
}