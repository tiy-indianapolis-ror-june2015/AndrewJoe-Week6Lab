class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :email, :password, :confirm_password,

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    render_wizard
  end
end