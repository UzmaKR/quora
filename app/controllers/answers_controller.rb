class AnswersController < ApplicationController
  
  def index
    @answers = Answer.all

  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @question= Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer: params[:answer][:answer],
                           user_id: current_user.id, 
                       question_id: params[:question_id])
    # if @answer.save
      redirect_to question_path(params[:question_id]), alert: "Thanks for answering this question!"
  #   else
  #     render :new
  #   end
  end
end
