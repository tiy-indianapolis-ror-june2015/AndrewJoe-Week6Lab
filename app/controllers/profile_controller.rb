class ProfileController < ApplicationController
before_action :set_user

  def follow
    if current_user == @user
      flash[:error] = "You can't follow yourself"
      redirect_to(posts_path)
    else
      current_user.follow(@user)
      flash[:notice] = "You are now following #{@user.name}."
      redirect_to(posts_path)
    end
  end

  def unfollow
    current_user.stop_following{@user}
    flash[:notice] = "You are no longer following #{@user.name}"
    redirect_to(posts_path)
  end

end
