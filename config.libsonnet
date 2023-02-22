{
  _config+:: {
    // Selectors
    nodeExporterSelector: 'node_name!=""',
    fsSelector: 'fstype!~"rootfs|selinuxfs|autofs|rpc_pipefs|tmpfs"',

    // Support for Grafana 7.2+ `$__rate_interval` instead of `$__interval`
    grafana72: true,
    grafanaIntervalVar: if self.grafana72 then '$__rate_interval' else '$__interval',

    // Config for the Grafana dashboards in the Percona Mixin
    grafanaPercona: {
      dashboardNamePrefix: 'Percona / ',
      dashboardTags: ['Percona'],

      // For links between grafana dashboards, you need to tell us if your grafana
      // servers under some non-root path.
      linkPrefix: '',

      // The default refresh time for all dashboards, default to 10s
      refresh: '10s',
      minimumTimeInterval: '1m',

      // Timezone for Grafana dashboards:: UTC, browser, ...
      grafanaTimezone: 'browser',
    },

    // Default datasource name
    datasourceName: 'Metrics',
  },
}
