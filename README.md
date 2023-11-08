# manual-certbot-dns-challenge
<img src="https://letsencrypt.org/images/letsencrypt-logo-horizontal.svg" alt="Let's Encrypt" width="30%"/>
<img src="https://www.docker.com/wp-content/uploads/2023/08/logo-guide-logos-1.svg" alt="Docker" width="30%"/>
<img src="https://raw.githubusercontent.com/EFForg/design/master/logos/eff-certbot-lockup.png" alt="Certbot" width="30%"/>

Sometimes you just need a valid TLS certificate, even in environments where you cannot access TCP ports 80 and / or 443 for obtaining certificates via automatic challenges like [http-01](https://letsencrypt.org/docs/challenge-types/#http-01-challenge) or [TLS-ALPN-01](https://letsencrypt.org/docs/challenge-types/#tls-alpn-01). Sometimes you just want to download it fast to manually copy it to the final server, without any requirement of automatic refresh.

And here you are 🚀

This shell script provides a [Docker](https://docs.docker.com/get-docker/) based command for manually creating a TLS certificate with [Lets' Encrypt](https://letsencrypt.org) using [DNS-01 Challenge](https://letsencrypt.org/docs/challenge-types/#dns-01-challenge).

This project is based on [Certbot](https://hub.docker.com/r/certbot/certbot/) and accepts the required arguments, like notification E-Mail and DNS name from the command line.

## Prequisties
1. Working [Docker](https://docs.docker.com/get-docker/) environment.
2. Access to a Domain Name Service provider
3. Access to a bash, sh or whatever shell terminal

# Get started
1. Clone the repository or simply copy the content of [manual-certbot-dns.sh](./manual-certbot-dns.sh) into a new shell script file (this new script file might need execution permissions, see [```chmod +x```](https://en.wikipedia.org/wiki/Chmod))
2. Run the shell script and add the required arguments:  

| argument | description                                                  |  
|--------- | ------------------------------------------------------------ |  
| e        | E-Mail where Let's encrypt will send expiring notifications  |  
| d        | DNS name to use in the certificate                           |  
| p        | If given it will use "Production Environment" certificate issuer. Otherwise "Staging Environment" |  

Please have a look at the [Staging Environment](https://letsencrypt.org/docs/staging-environment/) documentation of Let's Encrypt for further details.

Example:

```sh
./manual-certbot-dns.sh -e somebody@who-wants-a-notification.com -d mydomain.example.com -p
```
3. Follow the instructions in the commandline. You will need to manually create a [TXT record](https://en.wikipedia.org/wiki/TXT_record) with a given subdomain and a specific value in your DNS settings for the provided domain.
4. A new folder [certs](./certs/) will be created, containing the certificate (see subfolder [live](./certs/live/)) and all account settings.
5. Leve a ⭐️ if you like the project :)
6. Have a coffee... ☕️
