class QuestionsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create]

  def index
    @questions = Question.all
  end

  def show
    @answers = Answer.where('question_id=?', params[:id])
    @question = Question.find(params[:id])
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

  # def vote
  #   question = Question.find(params[:id])
  #   if vote = Vote.find_by_user_id_and_votable_id_and_votable_type(current_user.id, params[:id], "Question")
  #     redirect_to :back, alert: "You already voted on this."
  #   else
  #     vote = Vote.create(value: params[:value],votable_id: params[:id], votable_type: 'Question', user_id: current_user.id)
  #     question.score += params[:value].to_i
  #     question.save
  #     redirect_to :back, notice: "Vote Registered"
  #   end
  # end

end
