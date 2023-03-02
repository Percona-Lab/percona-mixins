# Summary of the PoC

## Dashboard linter

Dashboard linter identified some none-standard labels that we use instead of prom convention:
https://prometheus.io/docs/concepts/jobs_instances/

## Alerting

We can't upload Alert rules from upstream.

Workaround:

- place alert rules to `/srv/prometheus/rules/`
- enable VMAlert API: `-e VM_vmalert_proxyURL=http://127.0.0.1:8880` 

Example:
```sh
podman run --rm -d --name pmm-server -p 4443:443/tcp -v ./prometheus_alerts.yaml:/srv/prometheus/rules/prometheus_alerts.yml:z -v ./prometheus_rules.yaml:/srv/prometheus/rules/prometheus_rules.yml:z -e VM_vmalert_proxyURL=http://127.0.0.1:8880 pmm-server:2
```

## Grafonnet

Current state: https://grafana.slack.com/archives/C0146SMJ1FE/p1676304377280359
New changes are comming!

- https://github.com/grafana/grafonnet-lib/pull/380
- https://github.com/grafana/grafonnet-lib/issues/358#issuecomment-1445425918
- https://github.com/Duologic/crdsonnet/

More updates in: https://grafana.slack.com/archives/C024B5R8T60


## Links

- https://grafana.com/blog/2020/02/26/how-to-configure-grafana-as-code/
