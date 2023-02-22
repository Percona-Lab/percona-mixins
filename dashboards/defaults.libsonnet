{
  local perconaMixin = self,
  local grafanaDashboards = super.grafanaDashboards,

  grafanaDashboards:: {
    [filename]: grafanaDashboards[filename] {
      timezone: perconaMixin._config.grafanaPercona.grafanaTimezone,
      refresh: perconaMixin._config.grafanaPercona.refresh,
      tags: perconaMixin._config.grafanaPercona.dashboardTags,

      rows: [
        row {
          panels: [
            panel {
              // Modify tooltip to only show a single value
              tooltip+: {
                shared: false,
              },
              // Modify legend to always show as table on right side
              legend+: {
                alignAsTable: true,
                rightSide: true,
              },
              // Set minimum time interval for all panels
              interval: perconaMixin._config.grafanaPercona.minimumTimeInterval,
            }
            for panel in super.panels
          ],
        }
        for row in super.rows
      ],

      templating+: {
        list: std.map(
          function(template)
            if template.type == 'datasource' then
              template {
                current+: {
                  text: 'default',
                  value: perconaMixin._config.datasourceName,
                },
              }
            else
              template,
          super.list
        ),
      },

    }
    for filename in std.objectFields(grafanaDashboards)
  },
}
