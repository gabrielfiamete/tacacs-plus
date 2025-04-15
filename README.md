# tac_plus-ng
Run "tac_plus-ng", a new TACACS+ daemon, on Alpine Linux with Docker.  
This version of tac_plus-ng is a major rewrite of the original public Cisco source code and is in turn largely based on tac_plus from Marc Huber.  
It has multiple useful features, like LDAP / ActiveDirectory / RADIUS backends and rule-based permission assignment.   
Project URLs: https://github.com/MarcJHuber/event-driven-servers/   

---

## how to use it
---
### 1.) Script on docker host
Depending on your setup, you can use a simple bash script to manage the container on docker host: 

Create build image:

```
sh tac_plus-ng.sh build

```
Create container:

```
sh tac_plus-ng.sh create

```
### Logging
If you have enabled logging in your tac_plus-ng.cfg configuration file, all login attempts (failed or succeeded) are logged. The logging includes date, time, device, username, source of connection and status.  
