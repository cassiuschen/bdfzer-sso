module V1
  class UserAPI < Base
    namespace "user"

    get "info" do
      guard!
      @user = User.all
      return @user.to_json
    end

    get "secret" do
      { :secret => "only smart guys can see this ;)" }
    end
  end
end