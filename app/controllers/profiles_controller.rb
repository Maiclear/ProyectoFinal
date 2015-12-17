class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @ongs = @user.ongs
  end
end
