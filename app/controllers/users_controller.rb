class UsersController < ApplicationController
  def new
  end

  def show
  end

  def downgrade
    @user =  User.find(params[:id])
    @user.role = 'standard'

    if @user.save
      flash[:notice] = "You've been downgraded to a standard account."
      redirect_to root_path
    else
      flash[:error] = "There was an error downgrading your account. Try again."
      redirect_to root_path

  end
end
