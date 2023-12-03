# GuidePRO
## Back-end for GuidePRO bacherole of engineering final project

### Running instruction
To be able to creat back-end together with PostgreSQL run comman
<br>
`docker compose up -d` 
<br>
or if you want to see PostgreSQL and Flask logs
<br>
`docker compose up` 
<br>
<br>
To kill containers you either need to run command 
<br>
`docker compose down`
<br>
or click CTRL+C if you decided to not used -d flag
<br>
<br>
Flask created via docker compose will be working on porst 5001
<br>
<br>
In order to run Flask locally run command
<br>
`flask --app src/app.py run`
<br>
### Coding workflow
Firstly write your code and test it locally, after you will consider that code is done, test it also on 
containerized version. To create actual version of build, you need to run below command to rebuild 
backend to newer version
<br>
`docker compose up --build`
<br>
### Known possible issues
If you did something wrong on PostgreSQL, the best way will be to reset database. In order to do that turn down 
containers with unattaching volumes via running command
<br>
`docker compose down -v` 
<br>
and then
<br>
`docker compose up`
<br>
<br>