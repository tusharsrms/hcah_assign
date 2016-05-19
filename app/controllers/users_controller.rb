#
# Author:: Tushar Agarwal (tusharsrms@gmail.com)
# Copyright:: © 2016 Company Name
# Created on:: 18/05/2016
# --
# ++
#
class UsersController < ApplicationController

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

    respond_to do |format|
      if @user.save
        format.html { redirect_to new_user_path, notice: 'Users PDF is successfully created.' }
        format.pdf do
          render pdf: 'file_name',
                template: 'users/create.pdf.erb'#,
          #       layout: 'pdf.html.erb'
        end
      else
        format.html { render :new }
      end
    end
  end
  #end

  private
    # whitelisting parameters
    def user_params
      params.require(:user).permit(:first_name, :last_name, :address1, :address2, :state, :city, :zipcode, :signature)
    end
end
