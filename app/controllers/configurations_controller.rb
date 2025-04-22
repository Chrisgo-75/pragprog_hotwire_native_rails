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
            context: "model"
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
        }
      ]
    }
  end


end # END class