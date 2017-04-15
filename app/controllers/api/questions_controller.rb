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

  def create
   @question = Question.new(question_attributes)

   if @question.save
     render json: @question, status: :created, location: api_question_url(@question)
   else
     respond_with_errors(@question)
   end
 end

 private

 def question_params
   params.require(:data).permit(:type, {
     attributes: [:text, answers: [:text, :correct]]
   })
 end

 def question_attributes
   question_params[:attributes] || {}
 end

end
