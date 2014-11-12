module RoundsHelper

  def the_answers(round)
    round.question.answers.allowed_answers
  end
end
