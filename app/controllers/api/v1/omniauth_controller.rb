class Api::V1::OmniauthController < Api::V1::BaseController
  doorkeeper_for :all

  def index
    respond_with current_resource_owner
  end
end
