class Game < ActiveRecord::Base
  belongs_to :player

  validate :only_with_sufficient_questions, on: :create
  after_create :create_rounds

  def only_with_sufficient_questions
    if Question.has_correct_answer.count < 16
      errors.add(:base, 'Você precisa cadastrar mais do que 15 questões com RESPOSTAS
                               CORRETAS para poder começar a jogar!')
    end
  end

  def create_rounds
    # Selecionar de modo aleatório
  end
end