# Example Voting App

A simple distributed application. Uses Azure DevOps and majorly azure pipelines to manage and ACR . While AKS manages the heavy game 


## Architecture

![Architecture diagram](architecture.excalidraw.png)

* A front-end web app in [Python](/vote) which lets you vote between two options
* A [Redis](https://hub.docker.com/_/redis/) which collects new votes
* A [.NET](/worker/) worker which consumes votes and stores them in…
* A [Postgres](https://hub.docker.com/_/postgres/) database backed by a Docker volume
* A [Node.js](/result) web app which shows the results of the voting in real time

## Notes

We can later on also add argo-cd Image updater and get rid off the shell script to update ACR images
