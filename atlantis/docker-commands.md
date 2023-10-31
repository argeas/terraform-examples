


```
docker run -it --rm -p 4141:4141 -v $PWD/config:/config -v ~/.aws/credentials:/aws-config/credentials --name atlantis ghcr.io/runatlantis/atlantis:latest server \
--atlantis-url="https://ac37-152-37-109-99.eu.ngrok.io" \
--gitlab-webhook-secret="12345" \
--gitlab-user="argeas" \
--gitlab-token="glpat-EC6Stbc3DnxsAPhnXw_y" \
--repo-allowlist='gitlab.com/argeas/atlantis-test' \
--repo-config=/config/repos.yaml
```
