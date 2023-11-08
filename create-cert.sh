#!/bin/sh
while getopts e:d:p flag
do
    case "${flag}" in
        e) email=${OPTARG};;
        d) dns=${OPTARG};;
        p) prodStage=PROD;;
    esac
done

if [ -z "${email}" ]; then
    echo "E-Mail not given. use argument -e EMAIL to specify the email for Let's Encrypt expiring notification."
    exit 1
fi 

if [ -z "${dns}" ]; then
    echo "DNS not given. use argument -d DNS to specify the DNS name for the certificate to issue, eg. 'my.example.com'."
    exit 1
fi

if [ -z "${prodStage}" ]; then
    # uses Let's Encrypt Staging environment. Remove --test-cert for Production Environment. 
    # See for https://letsencrypt.org/docs/staging-environment/ more details!
    stageName="Staging Environment"
    stageArg=--test-cert
else
    stageName="Production Environment"
    stageArg=""
fi

echo "\nCreate Certificate for DNS-Name: $dns"
echo "E-Mail address to use for the let's encrypt account: $email"
echo "Stage to use: $stageName\n"

docker run -it --rm --name certbot \
            -v "./certs:/etc/letsencrypt" \
            -v "./certs:/var/lib/letsencrypt" \
            certbot/certbot:v2.7.4 certonly \
            -v \
            --manual \
            --agree-tos \
            --preferred-challenges dns \
            -d "$dns" \
            --email $email $stageArg