class Track < ActiveRecord::Base

  belongs_to :user

  validates :song_title, presence: true
  validates :artist, presence: true

  def upvote_count
    Upvote.where({track_id: id }).count
  end

  def upvoted_by_current_user?(user_id)
    Upvote.where({track_id: id, user_id: user_id}).count > 0
  end

end