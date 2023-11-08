#!/bin/sh
while getopts e:d: flag
do
    case "${flag}" in
        e) email=${OPTARG};;
        d) dns=${OPTARG};;
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

echo "Create Certificate for DNS-Name: $dns"
echo "E-Mail address to use for the let's encrypt account: $email"

docker run -it --rm --name certbot \
            -v "./certs:/etc/letsencrypt" \
            -v "./certs:/var/lib/letsencrypt" \
            certbot/certbot certonly \
            -v \
            --manual \
            --agree-tos \
            --preferred-challenges dns \
            -d "{$dns}" \
            --email {$email} \
            --test-cert