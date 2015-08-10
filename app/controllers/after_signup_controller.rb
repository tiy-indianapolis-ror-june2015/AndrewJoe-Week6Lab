class AfterSignupController < ApplicationController
  include Wicked::Wizard

	steps :name, :bio, :pic

  def update
    @user = current_user
		@user.attributes = user_params
		render_wizard @user
  end


  def show
    @user = current_user
    render_wizard
  end


private

	def user_params
    params.require(:user).permit(:name, :bio, :pic)
  end

	def finish_wizard_path
  	posts_path(current_user)
	end

	def redirect_to_finish_wizard(options = nil)
		redirect_to finish_wizard_path
	end

end
