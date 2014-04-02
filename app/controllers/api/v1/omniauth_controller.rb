class Api::V1::OmniauthController < Api::V1::BaseController

  doorkeeper_for :all

  def index
    respond_with current_token_owner
  end

  private
  def current_token_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper.token
  end
end
