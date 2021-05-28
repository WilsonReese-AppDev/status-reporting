class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update ]
  before_action :ensure_user_is_current_user
   
  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_url, notice: "Bench status was successfully updated." }
        format.json { render :show, status: :ok, location: @report }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:user_id, :bench_status)
    end

    def ensure_user_is_current_user
      if @user != current_user
        redirect_back fallback_location: root_url, alert: "You're not authorized for that."
      end
    end
end