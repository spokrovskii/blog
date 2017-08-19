class AdminUsersController < ApplicationController
  before_action :authorize_user

  def index
    @admin_users = User.all
  end

  def destroy
    User.destroy(params[:id])
    flash[:success] = 'User deleted'
    redirect_to admin_user_path
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Пользователь не найден")
    end
  end
end
