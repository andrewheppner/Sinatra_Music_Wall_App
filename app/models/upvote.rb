class Upvote < ActiveRecord::Base

belongs_to :users
belongs_to :tracks

end