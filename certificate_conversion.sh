# install openssl
# install keytool
# add chmod +x file_name.sh
#!/bin/bash

NAME_OF_P12_CERT="cert.p12"
NAME_OF_KEYSTORE="keystore.jks"
CERT_P12_PATH="/Users/user/test/cert.p12"
KEY_PATH="/Users/user/test/key.key"
CRT_PATH="/Users/user/test/cert.crt"
P12_PASSWORD="123456"
KEYSTORE_PASSWORD="123456"



# Проверка существования файловых путей
if [ ! -f "$KEY_PATH" ]; then
    echo "Файл '$KEY_PATH' не существует"
    exit 1
fi

if [ ! -f "$CRT_PATH" ]; then
    echo "Файл '$CRT_PATH' не существует"
    exit 1
fi

# Проверка наличия имени файла сертификата p12
if [ -z "$NAME_OF_P12_CERT" ]; then
    echo "Имя файла для PKCS12 не задано"
    exit 1
fi

# Проверка наличия пароля
if [ -z "$P12_PASSWORD" ]; then
    echo "Пароль для PKCS12 не задан"
    exit 1
fi

if [ -z "$KEYSTORE_PASSWORD" ]; then
    echo "Пароль для keystore.jks не задан"
    exit 1
fi



# Экспорт PKCS12-сертификата
openssl pkcs12 -export -out "$NAME_OF_P12_CERT" -inkey "$KEY_PATH" -in "$CRT_PATH" -passout pass:"$P12_PASSWORD"
if [ $? -ne 0 ]; then
    echo "Ошибка при экспорте PKCS12-сертификата"
    exit 1
fi

if [ ! -f "$CERT_P12_PATH" ]; then
    echo "Файл '$CERT_P12_PATH' не существует"
    exit 1
fi

# Импорт в keystore.jks
keytool -importkeystore -srckeystore "$CERT_P12_PATH" -srcstoretype pkcs12 -srcstorepass "$P12_PASSWORD" -destkeystore "$NAME_OF_KEYSTORE" -deststoretype jks -deststorepass "$KEYSTORE_PASSWORD"
if [ $? -ne 0 ]; then
    echo "Ошибка при импорте в keystore.jks"
    exit 1
fi

exit 0