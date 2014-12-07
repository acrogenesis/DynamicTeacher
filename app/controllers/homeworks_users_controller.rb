class HomeworksUsersController < ApplicationController
  def new
    @homework_user = HomeworkUser.new
  end

  def create
    @homework_user = HomeworkUser.new(homework_user_params)
    # authorize @homework_user

    if @homework_user.save
      redirect_to dashboard_path
    else
      redirect_to homework_path(@homework_user.homework_id)
    end
  end

  private

  def homework_user_params
    params.require(:homework_user).permit(:homework_id, :user_id, :url, :files)
  end
end
