class User < ActiveRecord::Base

  has_many :tracks

  validates :username, uniqueness: true


end