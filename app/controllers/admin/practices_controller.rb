class Admin::PracticesController < Admin::ApplicationController
  before_action :set_practice, only: [:show, :edit, :update, :destroy]

  def show
    @questions = Question.where(practice_id: @practice.id)
  end

  def new
    @practice = Practice.new
  end

  def edit
    @questions = Question.where(practice_id: @practice.id)
  end

  def create
    @practice = Practice.new(practice_params)
    authorize @practice

    if @practice.save
      redirect_to admin_dashboard_path(anchor: 'ejercicios')
    else
      redirect_to admin_dashboard_path(anchor: 'ejercicios')
    end
  end

  def update
    authorize @practice
    if @practice.update(practice_params)
      redirect_to admin_dashboard_path(anchor: 'ejercicios')
    else
      redirect_to admin_dashboard_path(anchor: 'ejercicios')
    end
  end

  def destroy
    authorize @practice
    @practice.destroy
  end

  private

  def set_practice
    @practice = Practice.find(params[:id])
  end

  def practice_params
    params.require(:practice).permit(:subject)
  end
end
