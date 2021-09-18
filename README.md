# shopify-2021-backend
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

[![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)

Custom Image Repository for [Shopify Backend Challenge](https://docs.google.com/document/d/1eg3sJTOwtyFhDopKedRD6142CFkDfWp1QvRKXNTPIOc/edit)  
The [Docker Image](https://hub.docker.com/repository/docker/billzzhang/shopify-2021-backend) is also provided  
Instructions on a Kubernetes deployment is found [here](https://github.com/Billzzhang/k8-shopify-2021-backend)

## Technologies
This project uses the Ruby on Rails framework, Tailwindcss for design, and a PostgreSQL database. In addition, a Dockerfile is provided for a docker image and a docker-compose script is provided from deployment.  
It is linted with Rubocop and tested using RSpec.

## Overview
This image repository aims to provide a quick and simple way to store multiple images at a time.  
All that's needed is to add one or multiple file and click upload! The images should then display on the main page.  
To delete any image, click on the image itself and click delete at the top.  
  
Main Page:  
  
![image](https://user-images.githubusercontent.com/21375588/133827961-930227b1-aca3-48eb-90e5-5583fd7331c5.png)  
  
Any specific image:
  
![image](https://user-images.githubusercontent.com/21375588/133828037-be0deeca-ab71-40c4-b604-20561482b1f7.png)

Uploading an image:  
  
![image](https://user-images.githubusercontent.com/21375588/133828398-09d9375a-9168-4690-b870-520f2588cbe3.png)

## Testing
All testing was done with [RSpec](https://rspec.info/) as it does behaviour driven testing. This extensively tests the project's controllers.  
To perform testing, use the following commands:
```
bundle install
bundle exec rspec
```

## Linting
Linting is done using Rubocop. To perform linting, use the following commands:
```
bundle install
bundle exec rubocop
```

## Deployment
To run, the environment variables need to be filled out first so `.env` needs to be filled out
```
cp dotenv .env
```
Then docker-compose can be used
```
docker-compose up
```
