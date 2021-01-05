class UsersController < ApplicationController
	before_action :authenticate_user
    before_action :ensure_correct_user

	def show
		@user = current_user
		@likes = Like.where(user_id: @user.id)
	end
	def edit
		@user = current_user
	end
	def update
		@user = current_user
		if @user.update(user_params)
			redirect_to root_path,notice: "Successful editing!!"
		else
			render :edit
		end
	end
	def ensure_correct_user
      @user = current_user
      if @user.id != current_user.id
         redirect_to root_path
      end
    end
    private
    def user_params
    	params.require(:user).permit(:name, :profle_image)
    end
end
