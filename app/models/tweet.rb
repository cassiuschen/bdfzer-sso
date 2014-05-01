class Tweet < ActiveRecord::Base
  belongs_to :user

  after_save do
  	self.create_feed
  end

  def create_feed
  	u = User.where("id = ?", self.user_id).first
  	f = u.feeds.new
  	f.provider = 1
  	f.body = <<-HTML
  	  发布了一条状态:
  	  <div class="extra text">
  	  #{self.body}
  	  </div>
  	HTML
  	f.save
  end
end
