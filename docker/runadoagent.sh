AZP_URL='https://dev.azure.com/KGDL02' 
AZP_TOKEN=''
AZP_AGENT_NAME='dockerSelf'
IMAGE_NAME='kgopi1/azselfhostedagent'
docker run -d --rm -e AZP_URL=$AZP_URL \
           -e AZP_TOKEN=$AZP_TOKEN \
           -e AZP_AGENT_NAME=$AZP_AGENT_NAME \
           -e AZP_POOL=$AZP_AGENT_NAME \
           --name azselfhostedagent \
           $IMAGE_NAME
