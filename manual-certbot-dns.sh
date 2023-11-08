#!/bin/sh
while getopts e:d: flag
do
    case "${flag}" in
        e) email=${OPTARG};;
        d) dns=${OPTARG};;
    esac
done

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