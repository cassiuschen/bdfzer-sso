class User < ActiveRecord::Base
  enum role: { student: 0, teacher: 1 }
  enum unit: { 
    unit_unknown: 0,
    unit_one:       1,
    unit_two:       2,
    unit_three:    3,
    unit_four:      4,
    unit_five:      5,
    unit_six:       6,
    unit_seven:    7 
  }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable,:omniauthable,
         :async
  validates :pku_id, :uniqueness => {
    :case_sensitive => false
  }
  mount_uploader :avatar, AvatarUploader
  after_create do
    self.teacher! if !!(self.pku_id.match(/^F.+/i))
    self.get_student_info if self.student?
  end

  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(pku_id) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.build_methods_to_find_students_in(*units)
    units.each do |unit|
      class_eval %Q{
        def students_in_#{unit}
          User.where("unit <> ?", User.units[:#{unit}])
        end
      }
    end
  end

  build_methods_to_find_students_in :unit_one, :unit_two, :unit_unknown,
                                              :unit_three, :unit_four,
                                              :unit_five, :unit_six, :unit_seven

  def get_student_info
    self.pku_id =~ /^(..)(.)(.)/
    if $2 == '2'
      self.grade = "20" + $1
      case $3
      when '1' then self.unit_one!
      when '2' then self.unit_two!
      when '3' then self.unit_three!
      when '4' then self.unit_four!
      when '5' then self.unit_five!
      when '6' then self.unit_six!
      when '7' then self.unit_seven!
      else
        self.unit_unknown!
      end
    end
  end 

  protected
  def confirmation_required?
    true
  end       
end
