#
# Author:: Tushar Agarwal (tusharsrms@gmail.com)
# Copyright:: © 2016 Company Name
# Created on:: 18/05/2016
# --
# ++
#
class UsersController < ApplicationController

  # GET /users/
  # Action used to get the user details.
  def show
    @user = User.find params[:id]
    respond_to do |format|
      format.html { render :show }
      format.pdf do
        render pdf: 'file_name',
              template: 'users/show.pdf.erb',
            layout: 'pdf.html.erb'
      end
    end
  end
  #end

  # GET /users/new
  # Action used to get the new form for the user.
  def new
    @user = User.new
  end
  #end

  # POST /users
  # Params: [:first_name, :last_name, :address1, :address2, :city, :state, :zipcode]
  # Action used to get the details of family alerts.
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'User Details are successfully stored.'
    else
      render :new
    end
  end
  #end

  private
    # whitelisting parameters
    def user_params
      params.require(:user).permit(:first_name, :last_name, :address1, :address2, :state, :city, :zipcode, :signature)
    end
end
