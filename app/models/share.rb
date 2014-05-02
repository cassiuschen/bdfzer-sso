class Share < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  def create_feed
  	u = User.where("id = ?", self.user_id).first
  	f = u.feeds.new
  	f.provider = 7
  	f.body = <<-HTML
  	  分享了:
  	  <div class="extra text">
  	  #{self.origin_body}
  	  </div>
  	HTML
  	f.save
  end
end
