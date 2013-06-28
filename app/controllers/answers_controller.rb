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

  # def vote
  #   debugger
  #   answer = Answer.find(params[:id])
  #   if vote = Vote.find_by_user_id_and_votable_id_and_votable_type(current_user.id, params[:id], "Answer")
  #     redirect_to :back, alert: "You already voted on this."
  #   else
  #     vote = Vote.create(value: params[:value],votable_id: params[:id], votable_type: 'Answer', user_id: current_user.id)
  #     answer.score += params[:value].to_i
  #     answer.save
  #     redirect_to :back, notice: "Vote Registered"
  #   end
  # end

end
