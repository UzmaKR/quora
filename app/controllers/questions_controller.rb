class QuestionsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create]

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      render :show, :locals => {:question => @question}
    else
      render :new
    end
  end

end
