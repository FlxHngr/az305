apt-get update
apt-get -y -q upgrade
apt-get -y -q install git apache2 wget unzip

cd /var/www/html

wget 'https://sgemeknlfskumnecmo.blob.core.windows.net/upload/app.zip?sp=r&st=2024-02-28T18:02:22Z&se=2024-03-09T02:02:22Z&sv=2022-11-02&sr=b&sig=1cbXsoxtsCuYDYpLsaz5XcGsxSZmUJ2ssEkbzW2gW9Q%3D' -O app.zip
unzip -o app.zip

a2enmod ssl
a2ensite default-ssl

mkdir /etc/apache2/certs
cd /etc/apache2/certs
wget 'https://sgemeknlfskumnecmo.blob.core.windows.net/upload/certs.zip?sp=r&st=2024-02-28T18:50:53Z&se=2024-03-02T02:50:53Z&sv=2022-11-02&sr=b&sig=AfDvgVvVbobZByHlbnvOqnseIeeU3cW3w074Lrg406U%3D' -O certs.zip
unzip -o -P gnsuxen certs.zip
rm certs.zip

wget 'https://sgemeknlfskumnecmo.blob.core.windows.net/upload/default-ssl.conf?sp=r&st=2024-02-28T19:02:57Z&se=2024-03-02T03:02:57Z&sv=2022-11-02&sr=b&sig=xPASEOhsYCA4NW0LW4nEh0N46wHBLjY3o7BsjzMAr7U%3D' -O /etc/apache2/sites-available/default-ssl.conf
systemctl enable apache2
systemctl restart apache2
