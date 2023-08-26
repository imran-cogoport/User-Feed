class ApplicationController < ActionController::API
  attr_accessor :interaction
  before_action :run_api

  def run_api
    api_name = request.path.split('/').last

    request_params = request.params

    self.interaction = api_name.camelize.constantize.run(request_params)

    if is_bad_request
      render json: self.interaction.errors, status: :bad_request and return
    end

    render json: self.interaction.result, status: :ok and return
  end

  def is_bad_request
    self.interaction.errors.present?
  end
end
