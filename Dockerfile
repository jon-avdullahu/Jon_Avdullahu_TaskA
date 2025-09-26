FROM php:8.2-apache

# Install tools needed for the lab (ping, netcat, gcc)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       iputils-ping netcat-traditional gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy web app
COPY src/ /var/www/html/
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Add root flag
RUN echo "ROOT_FLAG{CHANGE_ME}" > /root/root.txt \
    && chmod 600 /root/root.txt

# SUID misconfiguration: a tiny root shell helper
COPY rootshell.c /tmp/rootshell.c
RUN gcc /tmp/rootshell.c -o /usr/local/bin/rootshell \
    && chown root:root /usr/local/bin/rootshell \
    && chmod 4755 /usr/local/bin/rootshell \
    && rm -f /tmp/rootshell.c

# Apache will serve from /var/www/html by default
EXPOSE 80

