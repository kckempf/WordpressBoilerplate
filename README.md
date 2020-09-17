# WordpressBoilerplate
Boilerplate docker structure for dockerized Yahoo Wordpress instance

This repo hold boilerplate code meant to make it quick to spin up docker containers based on a Wordpress site exported from Yahoo Small Business.  The impetus behind this is that I wanted to experiment with upgrading a site for a client without permanently committing us to the new version, so that I could run some smoke tests.  It could conceivably be used to help migrate to a new service provider.

## Save site files to local directory via FTP
The best way to get your Wordpress application files to a local directory is to transfer them via FTP.  If you haven't used FTP yet with your Yahoo site, follow [this guide](https://help.smallbusiness.yahoo.net/s/article/SLN20431) to getting Filezilla set up, then move your files to a subfolder labeled "wordpress".  

## Create MySql database backup and save to local directory
Next, we need to create a backup of our current MySql database and save it to a local directory to be used by the docker container.  To do this you'll need to have an administrator login to your MySql database and have phpMyAdmin installed.
1. Set up your administrator user for your MySql database using [this guide](https://help.smallbusiness.yahoo.net/s/article/SLN20602#:~:text=Valid%20characters%20for%20the%20password,information%20for%20accessing%20your%20database.).
1. Install phpMyAdmin on your Yahoo site using [this guide](https://help.smallbusiness.yahoo.net/s/article/SLN20625)
1. Login to phpMyAdmin by navigating to the folder you defined in the previous step, using the MySql database user and password you set up in the first step.
1. Create a database backup following the steps in [this guide](https://help.smallbusiness.yahoo.net/s/article/SLN24455).
1. Place the script in the MySql directory of this project.  Be sure that it is the first script to be run by using a name that appears alphabetically before your migration script.

## Replace the placeholder settings in the docker-compose and migrate files
You'll need to replace the values in the boilerplate with your values.
1. In migrate.sql, replace the old site domain with the domain of your production Wordpress site so that the script converts all the links to now reference the container
1. In docker-compose.yml, change the password to secure passwords.  The values under the DB and wordrpress should match.  You can make this easier by using environment variables and having them reference the same environment variables from each container.

## Run docker-compose
Run the command `docker-compose up -d` to spin up the containers.
