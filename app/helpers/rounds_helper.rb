module RoundsHelper

  def the_answers(round)
    answers = Answer.allowed_answers(round.question.correct_answer_id, round.question.subject.id)
    answers << round.question.correct_answer
  end
end
