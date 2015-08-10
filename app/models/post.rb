class Post < ActiveRecord::Base

  validate :body
  validates_length_of :body, maximum: 170, message: "must be 170 characters or less"
  belongs_to :user


  def self.timeline(user)
    following_ids = user.all_following.map(&:id)
    all_ids= following_ids << user.id
    Post.where(user_id: all_ids).order("created_at DESC")
  end

end
