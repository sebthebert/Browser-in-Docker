FROM ubuntu

MAINTAINER Sebastien Thebert <stt@onetool.pm>

# Enables multiverse repository
RUN perl -pi -e 's/^#\s*(.+multiverse\s$)$/$1/g' /etc/apt/sources.list

# apt-get update, upgrade & install
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install firefox -y \
	&& apt-get install dbus -y \
	&& apt-get install flashplugin-installer -y \
	&& apt-get install unzip -y \
	&& apt-get install wget -y \
	&& apt-get install -y libglu1-mesa

# Adds custom scripts
ADD my_firefox.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/my_firefox.sh
ADD firefox_addon_install.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/firefox_addon_install.sh

# Installs 'AdBlock Plus' addon
RUN /usr/local/bin/firefox_addon_install.sh latest/1865/addon-1865-latest.xpi

ENTRYPOINT /usr/local/bin/my_firefox.sh
