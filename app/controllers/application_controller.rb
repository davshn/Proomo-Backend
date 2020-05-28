class ApplicationController < ActionController::Base
  def render_json(params)
    render params
  end
end
