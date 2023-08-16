**GHA**

GitHub Actions is a CI/CD platform that allows you to automate your build, test, and deployment pipeline.

It lets you run different workflows in response to changes or events in your repository(Automatically). 

You can use Linux, macOS, and Windows virtual machines to run your workflows(also known as Runners).


We find some basic concepts:

    Workflows: 
        Processes you define in a YAML file to run your jobs automatically. 
        Are defined in .github/workflows 

            building         

            testing        

            deployment   

            … 

    Events: 
        Triggers that run workflows.          

            push         

            pull request         

            push request         

            ...          

    Runners: 
        Virtual machines or servers that run your workflows when triggered. 
        Each workflow runs on its virtual machine, and a runner can run only one workflow at a time.  

    Action: 
        Custom application for the GitHub actions platform that performs a complex but frequently repeated task. 
        Pre-written set of instructions is used to perform tasks that are commonly used. 

    Job: 
        Step-by-step instructions executed on a Runner(actions or shell scripts), jobs run in parallel or independently. 
        You can define an execution graph so that jobs might run in parallel or sequentially.
        A Job might need to wait for many jobs to finish to run.

**Run python test on folder "test" with pytest**

    pytest

Test files should start with "test" word + anything
Write your workflows to run those tests. Run it on
GHA or in Jenkins(job or Pipeline)

**.github/workflows/workflow-01.yaml**

Sample that creates some jobs for the repository

**.github/workflows/workflow-02.yaml**

Sample that creates dependecies between jobs for the repository
