class ConfigurationsController < ApplicationController


  def ios_v1
    render json: {
      settings: {},
      rules: [
        {
          patterns: [
            "/new$",
            "/edit$"
          ],
          properties: {
            context: "modal"
          }
        }
      ]
    }
  end

  def android_v1
    render json: {
      settings: {},
      rules: [
        {
          patterns: [
            ".*"
          ],
          properties: {
            uri: "hotwire://fragment/web",
            pull_to_refresh_enabled: true
          }
        },
        {
          patterns: [
            "/new$",
            "/edit$"
          ],
          properties: {
            context: "modal",
            pull_to_refresh_enabled: false
          }
        },
        {
          patterns: [
            "/hikes/[0-9]+/map"
          ],
          properties: {
            view_controller: "map"
          }
        },
        {
          patterns: [
            "/hikes/[0-9]+/map"
          ],
          properties: {
            uri: "hotwire://fragment/map",
            title: "Map"
          }
        }
      ]
    }
  end


end # END class