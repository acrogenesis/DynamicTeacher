class Admin::QuestionsController < Admin::ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_diagnostic_exam_or_practice, only: [:new, :edit]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    authorize @question
    if @question.save
      if @question.diagnostic_exam_id
        redirect_to edit_admin_diagnostic_exam_path(params[:diagnostic_exam_id])
      else
        redirect_to edit_admin_practice_path(params[:practice_id])
      end
    else
      if @question.diagnostic_exam_id
        redirect_to admin_dashboard_path(anchor: 'examenes_diagnositcos')
      else
        redirect_to admin_dashboard_path(anchor: 'ejercicios')
      end
    end
  end

  def update
    authorize @question
    if @question.update(question_params)
      if @question.diagnostic_exam_id
        redirect_to edit_admin_diagnostic_exam_path(params[:diagnostic_exam_id])
      else
        redirect_to edit_admin_practice_path(params[:practice_id])
      end
    else
      if @question.diagnostic_exam_id
        redirect_to admin_dashboard_path(anchor: 'examenes_diagnositcos')
      else
        redirect_to admin_dashboard_path(anchor: 'ejercicios')
      end
    end
  end

  def destroy
    authorize @question
    @question.destroy
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def set_diagnostic_exam_or_practice
    if params[:diagnostic_exam_id]
      @object = DiagnosticExam.find(params[:diagnostic_exam_id])
      @back_route = edit_admin_diagnostic_exam_path(@object)
    elsif params[:practice_id]
      @object = Practice.find(params[:practice_id])
      @back_route = edit_admin_practice_path(@object)
    end
  end

  def question_params
    hash = params.require(:question).permit(:question, :diagnostic_exam_id,
                                            answers_attributes: [:answer, :field_type, :correct, :question_id, :_destroy, :id])
    hash['diagnostic_exam_id'] = params['diagnostic_exam_id']
    hash['practice_id'] = params['practice_id']
    hash
  end
end
