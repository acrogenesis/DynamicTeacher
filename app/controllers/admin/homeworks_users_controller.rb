class Admin::HomeworksUsersController < Admin::ApplicationController
  before_action :set_homework, only: [:show, :update, :destroy]

  def show
  end

  def update
    authorize @homework
    if @homework.update(homework_user_params)
      redirect_to admin_dashboard_path(anchor: 'revisar_tareas')
    else
      redirect_to admin_dashboard_path(anchor: 'revisar_tareas')
    end
  end

  def destroy
    authorize @homework
    if @homework.destroy
      redirect_to admin_dashboard_path(anchor: 'revisar_tareas')
    else
      redirect_to admin_dashboard_path(anchor: 'revisar_tareas')
    end
  end

  private

  def set_homework
    @homework = HomeworkUser.find(params[:id])
  end

  def homework_user_params
    params.require(:homework_user).permit(:homework_id, :user_id, :inline_grade, :inline_comment)
  end
end
