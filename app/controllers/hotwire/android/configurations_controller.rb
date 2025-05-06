module Hotwire
  module Android
    class ConfigurationsController < ApplicationController
      # Don't need to authenticate or role auth checks for these Controller Actions.
      # skip_before_action :require_authentication

      def v1
        render json: {
          settings: {},
          rules: [
            {
              patterns: [ ".*" ],
              properties: build_properties(context: "default", uri: "hotwire://fragment/web", pull_to_refresh_enabled: true)
            },
            {
              patterns: [
                "/new$",
                "/edit$"
              ],
              properties: build_properties(context: "modal", pull_to_refresh_enabled: false)
            },
            {
              patterns: [
                "/hikes/[0-9]+/map"
              ],
              properties: build_properties(view_controller: "map")
            },
            {
              patterns: [
                "/hikes/[0-9]+/map"
              ],
              properties: build_properties(uri: "hotwire://fragment/map", title: "Map")
            }
          ]
        }
      end

      private

      def build_properties(options = {})
        options
      end

    end
  end
end