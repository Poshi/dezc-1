# Data Engineering ZoomCamp - Module 1 - Docker and Terraform

To answer the questions of the quiz, just execute the different shell scripts
in order.

There are a couple of shell scripts that need some previous set-up.
These are question 3 and 7.
For them, there's a pre-question*.sh script that perform the appropriate setup.

You will have to modify your `variables.tf` file to point to your own
Google Cloud Platform credentials and to adjust the project name to one of
your own.

Also, don't forget the final `terraform destroy` if you don't want to keep
those resources and be billed for them.

## Warning

This is an educational repository and should not be taken as an example of
good security prectices.
Passwords are silly and have been checked-in in the repository, which is
usually a big NO.
For production purposes, you should take advantage of the secret provider
service of the platform you are using or, at least, provide the sensitive
data as environment variables and do not check in that data into the
repository.
This repository contains the passwords to ease the work on my colleagues
when they check my work.
