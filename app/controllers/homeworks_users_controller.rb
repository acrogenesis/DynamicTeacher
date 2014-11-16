class HomeworksUsersController < ApplicationController
  def new
    @homework_user = HomeworkUser.new
  end

  def create
    @homework_user = HomeworkUser.new(homework_user_params)
    @homework_user.save
  end

  private

  def homework_user_params
    params.require(:homework_user).permit(:homework_id, :user_id, :file)
  end
end
