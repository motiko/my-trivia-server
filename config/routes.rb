Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :play do
      get 'game/:game_id/:game_question_id/answer/:selected_answer', to: 'game#answer'
      get 'game/start', to: 'game#start'
    end
    jsonapi_resources :questions
    jsonapi_resources :players
    jsonapi_resources :avatars
  end
end
