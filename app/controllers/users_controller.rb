class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    unless User.find(params[:id]) == current_user
      redirect_to(root_path, notice: 'You are not authorized to perform that action')
    end
  end

  def update
    respond_to do |format|
      if @post.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :email)
  end

end