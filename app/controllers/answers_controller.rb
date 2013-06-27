class AnswersController < ApplicationController
  
  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params[:answer])
    if @answer.save
      render :show, :locals => {:answer => @answer}
    else
      render :new
    end
  end

end
