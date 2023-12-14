dockerPath='../adoagent/'
TF_VERSION='1.4.0'
AGENT_VERSION='3.232.0'

docker build --build-arg TF_VERSION=$TF_VERSION \
             --build-arg AGENT_VERSION=$AGENT_VERSION \
             $dockerPath \
             -t kgopi1/azselfhostedagent:latest