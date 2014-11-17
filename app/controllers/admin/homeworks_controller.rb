class Admin::HomeworksController < ApplicationController
  before_action :set_homework, only: [:show, :edit, :update, :destroy]

  def index
    @homeworks = Homework.all
  end

  def show
  end

  def new
    @homework = Homework.new
  end

  def edit
  end

  def create
    @homework = Homework.new(homework_params)

    if @homework.save
      redirect_to admin_dashboard_controller
    else
      render 'new'
    end
  end

  def update
    if @homework.update(homework_params)
      redirect_to admin_dashboard_controller
    else
      render 'edit'
    end
  end

  def destroy
    @homework.destroy
  end

  private

  def set_homework
    @homework = Homework.find(params[:id])
  end

  def homework_params
    params.require(:homework).permit(:level, :hw_type, :subject, :description, :deadline, :delivered)
  end
end
