class VotesController < ApplicationController
  before_filter :authenticate_user
  before_filter :already_voted

  def create
    debugger
    resource = params[:resource]
    case resource 
    when "Answer"
      answer = Answer.find(params[:id])
      current_user.vote!(answer, params[:value])
      redirect_to :back, notice: "Vote Registered"
    else
      question = Question.find(params[:id])
      current_user.vote!(question, params[:value])
      redirect_to :back, notice: "Vote Registered"
    end
  end

  private

  def already_voted
    vote = Vote.find_by_user_id_and_votable_id_and_votable_type(current_user.id, params[:resource_id], params[:resource])
    debugger
    if vote
      redirect_to :back, alert: "You already voted on this."
    end
  end
end
