class UserpagesController < ApplicationController
  layout 'posts'
  before_action :set_userpage, only: [:show, :edit, :update]

  # GET /userpages/1
  def show; end

  # GET /userpages/1/edit
  def edit; end

  # PATCH/PUT /userpages/1
  def update
    if @user.update(userpage_params)
      redirect_to @user, notice: 'Userpage was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userpage
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:userinfo).permit(:user_id, :username, :profile)
    end
end
