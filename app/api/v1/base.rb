module V1
  class Base < ApplicationAPI
    version "v1", :using => :path

    mount OmniauthAPI
  end
end
