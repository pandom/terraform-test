set -euo pipefail

BLACK_ON='\033[40m'
RED_TEXT='\033[0;31m'
RESET_TEXT='\033[0m'

AWS_PATTERN='(A3T[A-Z0-9]|AKIA|AGPA|AIDA|AROA|AIPA|ANPA|ANVA|ASIA)[A-Z0-9]{16}'
GCP_API_PATTERN='AIza[0-9A-Za-z_-]{35}'
# Note the Azure pattern is a .tf pattern check only as it's difficult to match without false-positives.
AZURE_API_PATTERN='client_secret\s+=\s+.{36}$'
PRIVATE_KEY_PATTERN='PRIVATE KEY-----'
JWT_PATTERN='^eyJ[A-Za-z0-9_=-]{33}.+\.[A-Za-z0-9_=-]+\.?[A-Za-z0-9_.+/=-]*$"'
# atlasv1 format currently covers Terraform Cloud, Terraform Enterprise, and Vagrant Cloud
ATLAS_PATTERN='[A-Za-z0-9]{14}\.atlasv1\.[A-Za-z0-9]{67}'