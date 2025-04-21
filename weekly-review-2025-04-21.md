- Test 1 was Multibrach Jenkins
- Issue was with the Token, added to credintials
- But that was giving error, to fix that we did add it to the credentials in the folder part of multibranch pipeline, and that worked.
- In the process from AWS side we need to have access to IAM and we need to create a token for External user there.


  Next step to do - 
  1. Bounce a EC2 instance from there
  2. Create a security group
  3. Create a key

Error :
 ERROR: Couldn't find any revision to build. Verify the repository and branch configuration for this job.
 Issue with Git Repo url


Windows command to start and stop Jenkins from CLI 
net stop jenkins
net start jenkins

The AWS Secret are stored as Secret text in Jenkins
