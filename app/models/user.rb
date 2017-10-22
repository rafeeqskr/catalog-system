class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :name, uniqueness: true, presence: true

  include Gravtastic
  gravtastic

  ['user','admin'].each do |type|
    define_method "#{type}?" do
      return self.user_type == type
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    where(email: warden_conditions[:email]).or(where(name: warden_conditions[:email])).first
  end
end
