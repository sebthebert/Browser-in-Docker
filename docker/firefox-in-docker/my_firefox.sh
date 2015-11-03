#!/bin/bash

DIR_HOME=/home/${BROWSER_USER_NAME}

echo "Creates '${BROWSER_USER_NAME}' browser user..."
useradd -u ${BROWSER_USER_UID} --home ${DIR_HOME} ${BROWSER_USER_NAME}

mkdir -p ${DIR_HOME}
chown -R ${BROWSER_USER_NAME} ${DIR_HOME}

echo "Starts firefox with '${BROWSER_USER_NAME}' browser user..."
su - ${BROWSER_USER_NAME} -c "firefox --private"
