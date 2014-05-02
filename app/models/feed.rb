class Feed < ActiveRecord::Base
  belongs_to :user
  enum provider: {
  	system: 0,
  	tweet: 1,
  	comment: 2,
  	article: 3,
  	yxtimes: 4,
  	discus: 5,
  	event: 6,
    share: 7
  }
end
