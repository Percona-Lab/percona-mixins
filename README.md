# Percona Mixins PoC

This project is a Prof of Concept to source, build and test Percona Dashboards, Alerts, Rules, and other configurations for the PMM.

## Build

You need to have Go 1.19 and make installed.

```sh
git clone https://github.com/Percona-Lab/percona-mixins.git
cd percona-mixins

make vendor generate
```

# Goals

Validate [Monitoring Mixins](https://monitoring.mixins.dev/) as a viable solution to meet such architectural characteristics:

- compatibility
- maintainability
- extensibility

Currently with [Percona Grafana Dashboards](https://github.com/percona/grafana-dashboards) there such problems to meet them:

- dashboards are incompatible with upstream
- maintaining dashboards as JSON objects is tough and cumbersome
  - updating some query/panel/variable in one dashboard that exists in many dashboards means modifying all of them
  - review makes a little sense and is quite hard
- to add new platforms, infra means that we should also operate with JSON object manually adjusting it to the none-standard variables
  - dashboards were done manually instead of importing upstream dashboards that are much more advanced
    - https://github.com/kubernetes-monitoring/kubernetes-mixin
    - https://github.com/prometheus/node_exporter/tree/master/docs/node-mixin
    - alerting and recording rules that are maintained by upstream are absent

## Upstream and Compatibility

See if we could improve monitoring by using more upstream configurations and standards.

Upstream monitoring communities are much bigger, and they drive innovation and standardization. Being outside the community means slower development, less extensibility, and poor compatibility.

### Rules: Alerts and Recording

Absent as a class in PMM, but the community has many Alerts and Recording rules that would bring more value to the PMM.

## Maintainability

Very hard to maintain plain JSON objects. Monitoring Mixins uses pure functional language to create templates, libraries, etc.

## Extensibility

PMM could easily import (and, if needed, adjust) Monitoring Mixins from the upstream projects. Following standard packaging means that for the customers that can't use PMM there is a standard method to generate a compatible configuration for the Prometheus-compatible solutions.

Check if we could upstream most of our configurations (dashboards) to the community projects. That will:

- bring more community contributors
- enables modularity of the solution

For example, we could upstream our dashboards to:

- https://github.com/prometheus-community/postgres_exporter/tree/master/postgres_mixin
- https://github.com/prometheus/mysqld_exporter/tree/main/mysqld-mixin

# Plan

1. Import some of the mixins from the community
2. Create a couple of the Percona dashboards as the mixins
3. Validate compatibility and document it for the dashboards
4. Validate upstream Alerts and Recording rules



