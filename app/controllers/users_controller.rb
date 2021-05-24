class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit_bench_status update_bench_status ]
   
  def edit_bench_status
  end

  def update_bench_status
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end