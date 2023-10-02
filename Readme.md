# Certificate conversion

## Descrption

Script that place .crt and .key in .jks


## Scripts for environments
1. **certificate_conversion.sh** - for mac && linux
2. **certificate_conversion.bat** - for windows

## Variables
You need to fill these variables
```
NAME_OF_P12_CERT="cert.p12"
NAME_OF_KEYSTORE="keystore.jks"
CERT_P12_PATH="/Users/user/test/cert.p12"
KEY_PATH="/Users/user/test/key.key"
CRT_PATH="/Users/user/test/cert.crt"
P12_PASSWORD="123456"
KEYSTORE_PASSWORD="123456"
```

## launch
**Mac && linux:**
1. Install openssl
2. Install keytool
3. Go to the folder with the script `cd /path/to/script_name.sh`
4. Make sure you have permission to run the script `ls -l script_name.sh`
5. Give the script execution rights `add chmod +x script_name.sh`
6. Run the script `./certificate_conversion.sh`

**Windows:**
1. Install openssl
2. Install keytool
3. 
