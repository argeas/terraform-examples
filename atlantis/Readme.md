

```
docker run -v config:/ -p 4141:4141 atlantis-2 server \
--atlantis-url="$URL" \
--gitlab-user="$USERNAME" \
--gitlab-token="$TOKEN" \
--gitlab-webhook-secret="$SECRET" \
--repo-allowlist="*" \
--repo-config="repos.yaml"
```

```
docker run \
--env-file=<.env-file> \
-p 4141:4141 \
-v <pwd>/config_data/:/etc/terrascan/ \
tenable/terrascan_atlantis server \
--gh-user="$USERNAME" --gh-token="$TOKEN" --gh-webhook-secret="$SECRET" \
--repo-allowlist="$REPO_ALLOWLIST" \
-c /etc/terrascan/config.toml
```
#https://github.com/tenable/terrascan

```
#atlantis server \
#--atlantis-url="$URL" \
#--gitlab-user="$USERNAME" \
#--gitlab-token="$TOKEN" \
#--gitlab-webhook-secret="$SECRET" \
#--repo-allowlist="$REPO_ALLOWLIST"
```