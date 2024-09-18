FROM debian:latest

# Install necessary packages and dependencies
RUN apt-get update && \
    apt-get install -y wget tor apache2 perl shared-mime-info supervisor && \
    apt-get clean

# Download and install Webmin
RUN wget -O /tmp/webmin.deb http://downloads.sourceforge.net/project/webadmin/webmin/1.973/webmin_1.973_all.deb && \
    dpkg -i /tmp/webmin.deb || true && \
    apt-get -f install -y && \
    rm /tmp/webmin.deb

# Configure Webmin to use HTTP
RUN sed -i 's/ssl=1/ssl=0/' /etc/webmin/miniserv.conf

# Copy configuration files
COPY torrc /etc/tor/torrc
COPY init-webmin.sh /usr/local/bin/init-webmin.sh

# Make the script executable
RUN chmod +x /usr/local/bin/init-webmin.sh

# Supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expose ports
EXPOSE 80 10000

# Start the custom initialization script
CMD ["/usr/local/bin/init-webmin.sh"]
