Rails.application.routes.draw do
  root to: "home#index"
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :play do
      get 'game/answer/:game_question_id/:selected_answer', to: 'game#answer'
      get 'game/:game_id/get_question', to: 'game#get_question'
      get 'game/start', to: 'game#start'
    end
  end
end
