class Api::V1::BaseController < ApplicationController
  respond_to :json

  private
    def current_resource_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
    end
end
