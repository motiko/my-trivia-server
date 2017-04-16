class Api::QuestionResource < JSONAPI::Resource
  attributes :text, :answers
end
