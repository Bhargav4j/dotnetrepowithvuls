# VULNERABILITY: Using outdated base image with known vulnerabilities
FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal

# VULNERABILITY: Running as root user
USER root

# VULNERABILITY: Installing vulnerable packages
RUN apt-get update && apt-get install -y \
    openssl=1.1.1f-1ubuntu2.19 \
    curl=7.68.0-1ubuntu2.18 \
    wget=1.20.3-1ubuntu2 \
    git=1:2.25.1-1ubuntu3.10 \
    vim=2:8.1.2269-1ubuntu5.11 \
    nano=4.8-1ubuntu1 \
    telnet=netkit-telnet-0.1-1ubuntu2 \
    ftp=0.17-34.1 \
    nmap=7.80+dfsg1-2build1 \
    netcat=1.206-1ubuntu1 \
    python3=3.8.2-0ubuntu2 \
    python3-pip=20.0.2-5ubuntu1.9 \
    nodejs=10.19.0~dfsg-3ubuntu1 \
    npm=6.14.4+ds-1ubuntu2 \
    && rm -rf /var/lib/apt/lists/*

# VULNERABILITY: Installing vulnerable Python packages
RUN pip3 install \
    requests==2.25.1 \
    urllib3==1.26.5 \
    cryptography==3.4.8 \
    paramiko==2.7.2 \
    flask==2.0.1 \
    django==3.2.4 \
    jinja2==3.0.1 \
    werkzeug==2.0.1 \
    pillow==8.3.2 \
    numpy==1.21.2 \
    pandas==1.3.3 \
    matplotlib==3.4.3 \
    scipy==1.7.1 \
    scikit-learn==1.0.2 \
    tensorflow==2.6.0 \
    torch==1.9.0 \
    opencv-python==4.5.3.56 \
    beautifulsoup4==4.9.3 \
    lxml==4.6.3 \
    xmltodict==0.12.0 \
    pyyaml==5.4.1 \
    configparser==5.0.2 \
    psutil==5.8.0 \
    paramiko==2.7.2 \
    fabric==2.5.0 \
    ansible==4.0.0 \
    kubernetes==18.20.0 \
    docker==5.0.0 \
    boto3==1.18.44 \
    azure-storage-blob==12.8.1 \
    google-cloud-storage==1.42.3 \
    redis==3.5.3 \
    pymongo==3.12.0 \
    mysql-connector-python==8.0.26 \
    psycopg2-binary==2.9.1 \
    sqlalchemy==1.4.23 \
    alembic==1.7.1 \
    celery==5.1.2 \
    flower==0.9.7 \
    supervisor==4.2.2 \
    gunicorn==20.1.0 \
    uwsgi==2.0.20 \
    nginx==1.18.0 \
    apache2==2.4.41 \
    openssh-server==1:8.2p1-4ubuntu0.4 \
    vsftpd==3.0.3-12 \
    proftpd==1.3.6e \
    bind9==1:9.16.1-0ubuntu2.11 \
    postfix==3.4.13-0ubuntu1.2 \
    sendmail==8.15.2-18 \
    exim4==4.94.2-7ubuntu1.5 \
    dovecot==2.3.7.2-1ubuntu3.2 \
    squirrelmail==1.4.22-6ubuntu1 \
    roundcube==1.4.9-1ubuntu1 \
    wordpress==5.7.2+dfsg-0ubuntu0.20.04.1 \
    joomla==3.9.28-1 \
    drupal==8.9.20-1 \
    mediawiki==1.35.3-1 \
    phpmyadmin==4:5.0.4+dfsg1-1ubuntu0.1 \
    php==1:7.4+75 \
    apache2-utils==2.4.41-4ubuntu3.13 \
    libapache2-mod-php==1:7.4+75 \
    libapache2-mod-python==3.7.3-1 \
    libapache2-mod-perl2==2.0.11-1build1 \
    libapache2-mod-php==1:7.4+75 \
    libapache2-mod-python==3.7.3-1 \
    libapache2-mod-perl2==2.0.11-1build1 \
    libapache2-mod-php==1:7.4+75 \
    libapache2-mod-python==3.7.3-1 \
    libapache2-mod-perl2==2.0.11-1build1

# VULNERABILITY: Installing vulnerable Node.js packages
RUN npm install -g \
    express@4.17.1 \
    body-parser@1.19.0 \
    cookie-parser@1.4.5 \
    multer@1.4.2 \
    helmet@4.6.0 \
    cors@2.8.5 \
    morgan@1.10.0 \
    compression@1.7.4 \
    serve-static@1.14.1 \
    express-session@1.17.2 \
    passport@0.4.1 \
    passport-local@1.0.0 \
    passport-jwt@4.0.0 \
    jsonwebtoken@8.5.1 \
    bcryptjs@2.4.3 \
    crypto@1.0.1 \
    crypto-js@4.0.0 \
    md5@2.3.0 \
    sha1@1.1.1 \
    sha256@0.2.0 \
    sha512@0.0.1 \
    bcrypt@5.0.1 \
    scrypt@6.0.3 \
    argon2@0.27.2 \
    pbkdf2@3.1.2 \
    hmac@1.0.0 \
    aes-js@3.1.2 \
    des@1.0.1 \
    rc4@1.0.0 \
    blowfish@0.1.0 \
    twofish@0.0.1 \
    serpent@1.0.0 \
    cast5@0.0.1 \
    cast6@0.0.1 \
    idea@0.0.1 \
    seed@0.0.1 \
    camellia@0.0.1 \
    aria@0.0.1 \
    sm4@0.0.1 \
    sm2@0.0.1 \
    sm3@0.0.1 \
    sm9@0.0.1 \
    gost@0.0.1 \
    kuznyechik@0.0.1 \
    magma@0.0.1 \
    grasshopper@0.0.1 \
    belT@0.0.1 \
    kalyna@0.0.1 \
    simon@0.0.1 \
    speck@0.0.1 \
    lea@0.0.1 \
    hight@0.0.1 \
    clefia@0.0.1 \
    camellia@0.0.1 \
    aria@0.0.1 \
    seed@0.0.1 \
    idea@0.0.1 \
    blowfish@0.1.0 \
    twofish@0.0.1 \
    serpent@0.0.1 \
    cast5@0.0.1 \
    cast6@0.0.1 \
    rc4@1.0.0 \
    des@1.0.1 \
    aes-js@3.1.2 \
    hmac@1.0.0 \
    pbkdf2@3.1.2 \
    argon2@0.27.2 \
    scrypt@6.0.3 \
    bcrypt@5.0.1 \
    sha512@0.0.1 \
    sha256@0.2.0 \
    sha1@1.1.1 \
    md5@2.3.0 \
    crypto-js@4.0.0 \
    crypto@1.0.1 \
    bcryptjs@2.4.3 \
    jsonwebtoken@8.5.1 \
    passport-jwt@4.0.0 \
    passport-local@1.0.0 \
    passport@0.4.1 \
    express-session@1.17.2 \
    serve-static@1.14.1 \
    compression@1.7.4 \
    morgan@1.10.0 \
    cors@2.8.5 \
    helmet@4.6.0 \
    multer@1.4.2 \
    cookie-parser@1.4.5 \
    body-parser@1.19.0 \
    express@4.17.1

# VULNERABILITY: Setting weak file permissions
RUN chmod 777 /tmp && \
    chmod 777 /var/tmp && \
    chmod 777 /dev/shm && \
    chmod 777 /proc && \
    chmod 777 /sys

# VULNERABILITY: Creating weak passwords and credentials
RUN echo "root:password123" | chpasswd && \
    echo "admin:admin123" | chpasswd && \
    echo "user:user123" | chpasswd && \
    echo "test:test123" | chpasswd && \
    echo "guest:guest123" | chpasswd

# VULNERABILITY: Installing vulnerable .NET packages
WORKDIR /app
COPY VulnerableApi/ ./

# VULNERABILITY: Using vulnerable .NET runtime
RUN dotnet restore --verbosity normal

# VULNERABILITY: Exposing all ports
EXPOSE 1-65535

# VULNERABILITY: Running with elevated privileges
USER root

# VULNERABILITY: Weak health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:5000/health || exit 1

# VULNERABILITY: Running with dangerous capabilities
ENTRYPOINT ["dotnet", "VulnerableApi.dll"] 