class AfterSignupController < ApplicationController
  include Wicked::Wizard

  steps :name, :bio, :pic

  def show
    @user = current_user
    render_wizard
  end

  def update
    @user = current_user
    render_wizard
  end
end
