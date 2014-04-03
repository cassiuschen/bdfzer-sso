class Api::V1::OmniauthController < Api::V1::BaseController
  doorkeeper_for :all

  def index
    hash = {
      provider: 'bdfzer',
      id: current_resource_owner.id.to_s,
      info: {
        email: current_resource_owner.email
      },
      extra: {
        name: current_resource_owner.name,
        pku_id: current_resource_owner.pku_id
      }
    }

    render json: hash.to_json
  end
end
