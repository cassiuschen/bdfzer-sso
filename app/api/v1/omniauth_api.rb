module V1
  class OmniauthAPI < Base
    namespace 'omniauth'
    guard_all!

    get 'user' do
      respond_with current_token_owner
    end

    private
    def current_token_owner
      User.find(doorkeeper_token.resource_owner_id) if doorkeeper.token
    end
  end
end
