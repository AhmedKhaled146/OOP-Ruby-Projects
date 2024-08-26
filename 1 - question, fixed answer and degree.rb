# Questions and Fixed Answer

class Question
  attr_accessor :prompt, :answer

  def initialize(prompt, answer)
    @prompt = prompt
    @answer = answer
  end
end

q1 = "We define an algorithm’s worst-case time complexity by using?\n(a) Big-O Notation\n(b) Omega Notation\n(c) Theta Notation\n"
q2 = "It defines the best case of an algorithm’s time complexity?\n(a) Big-O Notation\n(b) Omega Notation\n(c) Theta Notation\n"
q3 = "It defines the average case of an algorithm’s time complexity?\n(a) Big-O Notation\n(b) Omega Notation\n(c) Theta Notation\n"

questions = [
  Question.new(q1, "a"),
  Question.new(q2, "b"),
  Question.new(q3, "c"),
]

def main(questions)
  score = 0
  puts "Welcome to the Quiz! Please type the letter corresponding to your answer."
  questions.each do |question|
    puts question.prompt
    answer = ""
    loop do
      answer = gets.chomp().downcase
      break if ['a', 'b', 'c'].include?(answer)
      puts "Please enter a valid option (a, b, or c)."
    end
    score += 1 if answer == question.answer
  end
  puts "You got #{score}/#{questions.length} correct."
end

main(questions)
