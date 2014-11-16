class HomeworksController < ApplicationController
  before_action :set_homework, only: [:show]

  def show
    @homework_user = HomeworkUser.new
  end

  def create
    @homework_user = HomeworkUser.new(homework_user_params)
    @homework_user.save
  end

  private

  def set_homework
    @homework = Homework.find(params[:id])
  end

  def homework_user_params
    params.require(:homework_user).permit(:homework_id, :user_id, :file)
  end
end
