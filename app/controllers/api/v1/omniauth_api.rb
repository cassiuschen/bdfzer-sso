class ApiController::V1::OmniauthController < ApiController::ApplicationController

  doorkeeper_for :all

  def show
    respond_with current_token_owner
  end

  private
  def current_token_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper.token
  end
end
