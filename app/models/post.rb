class Post < ActiveRecord::Base

  validate :body
  validate :post_length
  belongs_to :user


  def post_length
    errors.add(:body, "of post is too long, can't be longer than 170 characters") unless body.to_s.length < 170
  end

end
