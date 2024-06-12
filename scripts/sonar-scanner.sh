#https://github.com/SonarSource/sonar-scanner-cli/releases

sudo apt update -y
sudo apt install nodejs npm wget unzip -y

sonar_scanner_version="5.0.1.3006"
wget -q https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip
unzip sonar-scanner-cli-${sonar_scanner_version}-linux.zip
sudo mv sonar-scanner-cli-${sonar_scanner_version}-linux sonar-scanner
sudo rm -rf /var/opt/sonar-scanner || true
sudo mv sonar-scanner /var/opt
sudo rm -rf /usr/local/bin/sonar-scanner || true
# /var/opt/sonar-scanner/bin/sonar-scanner --version (absolute path to the binaries)
#OR SEE BELOW
sudo ln -s /var/opt/sonar-scanner/bin/sonar-scanner /usr/local/bin || true
sonar-scanner -v




# Define SonarScanner download URL
SONAR_SCANNER_URL="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-linux.zip"

# Define SonarScanner directory
SONAR_SCANNER_DIR=/opt/sonar-scanner

# Create directory to store SonarScanner
sudo mkdir -p $SONAR_SCANNER_DIR

# Download SonarScanner
sudo wget -q $SONAR_SCANNER_URL -O /tmp/sonar-scanner.zip

# Unzip SonarScanner
sudo unzip -q /tmp/sonar-scanner.zip -d $SONAR_SCANNER_DIR

# Remove the downloaded zip file
sudo rm /tmp/sonar-scanner.zip

# Add SonarScanner bin directory to PATH
echo "export PATH=\$PATH:${SONAR_SCANNER_DIR}/bin" | sudo tee -a /etc/profile.d/sonar-scanner.sh

# Reload profile
source /etc/profile.d/sonar-scanner.sh

# Verify SonarScanner installation
echo "SonarScanner version:"
sonar-scanner --version