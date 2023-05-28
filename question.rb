class Question
  attr_accessor :question_body, :question_correct_answer, :question_answers

  def initialize(raw_text, raw_answers)
    @question_body = raw_text
    load_answers(raw_answers)
  end

  def display_answers
    question_answers.map.with_index { |answer, index| "#{(index + 65).chr}. #{answer}" }
  end

  def to_s
    question_body
  end

  def to_h
    {
      question_body: question_body,
      question_correct_answer: question_correct_answer,
      question_answers: question_answers
    }
  end

  def to_json
    to_h.to_json
  end

  def to_yaml
    to_h.to_yaml
  end

  def load_answers(raw_answers)
    shuffled_answers = raw_answers.shuffle
    @question_correct_answer = shuffled_answers.index(raw_answers.first)
    @question_answers = shuffled_answers
  end

  def find_answer_by_char(char)
    question_answers[char.ord - 65] if char.between?('A', 'Z')
  end
end