class Api::V1::OmniauthController < Api::V1::BaseController
  doorkeeper_for :all

  def index
    hash = {
      provider: 'bdfzer',
      id: current_resource_owner.id.to_s,
      uid: current_resource_owner.id.to_s,
      info: {
        email: current_resource_owner.email,
        name: current_resource_owner.name,
        image: "http://bdfzer-auth.qiniudn.com/user_avatar/#{current_resource_owner.id}/avatar.jpg",
        phone: current_resource_owner.phone
      },
      extra: {
        name: current_resource_owner.name,
        pku_id: current_resource_owner.pku_id,
        contact: current_resource_owner.contact.
        grade: current_resource_owner.grade,
        unit: current_resource_owner.unit.to_s,
        sex: current_resource_owner.sex,
      }
    }

    render json: hash.to_json
  end
end
