class Api::QuestionsController < ApplicationController
  def index
    render json: Question.all
  end

  def show
    question = Question.find(params[:id])
    render json: question
  end

  def destroy
    result = Question.find({id: params[:id]}).destroy
    render json: {}
  end

  def new
    render json: Question.all
  end
end
