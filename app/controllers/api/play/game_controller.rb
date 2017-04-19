class Api::Play::GameController < ApplicationController
  def start
    @player = Player.first
    @rules = Rules.first
    questions = Question.all.take(@rules.questions_amount)
    @game = Game.create(rules: @rules, status: :started)
    @game.questions = questions
    next_unanswered = @game.next_unanswered
    @game.players << @player
    render json: {game_id: @game.id,
                  next_question: { id: next_unanswered.id,
                    question_text: next_unanswered.question.text,
                    answers_text: next_unanswered.question.answers_text}
        }
  end

  def get_question
    @game = Game.find(params[:game_id])
    next_unanswered = @game.next_unanswered
    if next_unanswered
      render json: {game_id: params[:game_id],
                    question: { id: next_unanswered.id,
                      text: next_unanswered.question.text,
                      answers: next_unanswered.question.answers_text}
            }
    else
      render text: "finished"
    end
  end

  # atomic update (only need for multiplayer game)
  #GameQuestion.where(id: params[:game_question_id])
  #            .update_all(selected_answer: 1,:updated_at => Time.now)
  def answer
    @game_question = GameQuestion.find(params[:game_question_id])
    @game = @game_question.game
    @game_question.selected_answer = params[:selected_answer]
    @game_question.save
    @question = @game_question.question

    next_unanswered = @game.next_unanswered
    if next_unanswered
      render json: {game_id: params[:game_id],
                    question: { id: next_unanswered.id,
                      text: next_unanswered.question.text,
                      answers: next_unanswered.question.answers_text}
            }
    else
      render text: "finished"
    end
  end
end
