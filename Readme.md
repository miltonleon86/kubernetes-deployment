# How to use:
* Just use this image in your pippeline to have kubectl to your cluster.
* Cluster spec and passwords are saved on gitlab secret, create a new secret and use it to connect to another cluster and modify the used secret on the gitlab-ci definition.
* The general-release registry does not have kops installed because cluster orchestration should not be allow from the pippline.

# Fast local test:
* docker pull miltonleon86/kubernetes-gitlab-deployment
* docker run -it miltonleon86/kubernetes-gitlab-deployment bash
* kubectl get nodes     

# Using it in the pippeline
    image: docker:latest

    services:
      - docker:dind

    stages:
    - kubeStagingDeploy

    kube_Staging_release:
      stage: kubeStagingDeploy
      image: miltonleon86/kubernetes-gitlab-deployment
      script:
        - kubectl get nodes