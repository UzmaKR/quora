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

  def vote
    question = Question.find(params[:id])
    vote = Vote.new(value: params[:value], votable_id: params[:id], votable_type: 'Question', user_id: current_user.id)
    if vote.save
      redirect_to :back, notice: "Vote Registered"
      question.score += params[:value].to_i
      question.save
    else
      redirect_to :back, alert: "You already voted on this."
    end

  end

end
