class AdminUsersController < ApplicationController
  before_action :authorize_user

  def index
    @admin_users = Model.all
  end

  def destroy
    Model.destroy(params[:id])
    flash[:success] = 'User deleted'
    redirect_to admin_models_path
  end

  def authorize_user
    if !model_signed_in? || !current_model.admin?
      raise ActionController::RoutingError.new("Пользователь не найден")
    end
  end
end
