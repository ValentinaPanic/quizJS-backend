class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :codeQuestion, :optionA, :optionB, :optionC, :optionD, :correctAnswer, :explanation
end
