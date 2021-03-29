class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end
  
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end
  
    def show
        @user = User.find_by_id(params[:id])
    end

    def edit
    end
  
    def update
    end
  
    def delete
    end
  
    

private

  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
