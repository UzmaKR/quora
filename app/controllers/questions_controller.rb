class QuestionsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end
end
