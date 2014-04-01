module V1
  class SampleAPI < Base
    namespace "sample"

    get "hello" do
      guard!
      { :hello => "world" }
    end

    get "secret" do
      { :secret => "only smart guys can see this ;)" }
    end
  end
end