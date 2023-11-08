# manual-certbot-dns-challenge
Commands for manually creating a TLS certificate with Lets' Encrypt using DNS Challenge.

This project is based on [Certbot](https://hub.docker.com/r/certbot/certbot/) and accepts the required arguments, like notification E-Mail and DNS name from the command line.

## Prequisties
1. Working [Docker](https://docs.docker.com/get-docker/) environment.
2. Access to a Domain Name Service provider
3. Access to a bash, sh or whatever shell terminal

# Get started
1. Clone the repository or simply copy the content of [manual-certbot-dns.sh] into a new text file (this new text might need execution permissions)
2. Run the shell script and add the required arguments

```sh
./manual-certbot-dns.sh -e somebody@who-wants-a-notification.com -d mydomain.example.com
```
3. Follow the instructions in the commandline
4. A new folder [certs](./certs/) will be created, containing the certificate (see subfolder [live](./certs/live/)) and all account settings.
5. Leve a ⭐️ if you like the project :)
6. Have a coffee... ☕️
