class Game < ActiveRecord::Base
  belongs_to :player
  has_many :rounds, dependent: :delete_all, autosave: true

  validates_presence_of :player
  after_create :create_rounds

  scope :last_games, -> { joins(:player).order('`games`.worth DESC') }

  def has_jumps?
    true if jump > 0
  end

  def create_rounds
    # Selecionar de modo aleatório
    all_shuffled_questions = Question.is_selectable
    first_block = all_shuffled_questions[0..4]
    two_block = all_shuffled_questions[5..9]
    three_block = all_shuffled_questions[10..16]

    incrementer_worth = 1_000
    incrementer_miss = 500

    (0..4).each do |i|
      if i == 0
        Round.create(question: first_block[i], worth: 1000,
                     quit: 500, miss: 0, game: self)
      else
        Round.create(question: first_block[i], worth: incrementer_worth * (i + 1),
                     quit: incrementer_worth * i, miss: incrementer_miss * i, game: self)
      end
    end

    incrementer_worth = 10_000
    incrementer_miss = 5_000

    (0..4).each do |i|
      if i == 0
        Round.create(question: two_block[i], worth: 10000,
                     quit: 5000, miss: 2500, game: self)
      else
        Round.create(question: two_block[i], worth: incrementer_worth * (i + 1),
                     quit: incrementer_worth * i, miss: incrementer_miss * i, game: self)
      end
    end

    incrementer_worth = 100_000
    incrementer_miss = 50_000

    (0..4).each do |i|
      if i == 0
        Round.create(question: three_block[i], worth: 100000,
                     quit: 50000, miss: 25000, game: self)
      else
        Round.create(question: three_block[i], worth: incrementer_worth * (i + 1),
                     quit: incrementer_worth * i, miss: incrementer_miss * i, game: self)
      end
    end

    Round.create(question: three_block[5], worth: 1_000_000, quit: 500_000, miss: 0, game: self)
  end
end