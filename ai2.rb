require "set"

module Ai2
  class Scorer
    def initialize
      @cache = {}
    end

    def score(pattern, guess)
      @cache["#{pattern}:#{guess}"] ||= begin
        score = ""
        check_pattern = pattern.dup
        guess_chars = guess.chars

        guess_chars.each_with_index do |guess_color, index|
          next unless check_pattern[index] == guess_color
          score << "B"
          guess_chars[index] = " "
          check_pattern[index] = " "
        end

        guess_chars.each do |guess_color|
          match_index = check_pattern.index(guess_color)
          next unless match_index && guess_color != " "
          score << "W"
          check_pattern[match_index] = " "
        end

        score
      end
    end
  end

  class Runner
    COLORS = %w[1 2 3 4 5 6].freeze
    PATTERN_SIZE = 4
    POSSIBLE_PATTERNS = COLORS.product(*Array.new(PATTERN_SIZE - 1) { COLORS }).map(&:join)
    puts "Possible patterns : #{POSSIBLE_PATTERNS}"

    def initialize(scorer: Scorer.new)
      @scorer = scorer
    end

    def run(secret = Array.new(PATTERN_SIZE) { COLORS.sample }.join)
      unused_patterns = POSSIBLE_PATTERNS.dup
      potential_patterns = Set.new(unused_patterns)

      guess_count = 1
      guess = "1122"
      loop do
        puts "guessing #{guess}"

        score = @scorer.score(secret, guess)

        if score == "BBBB"
          puts "correct! winner in #{guess_count}"
          $won_flag = true
          break
        end

        puts "score: #{score}"

        unused_patterns.reject! { |pattern|
          pattern == guess }

        potential_patterns.reject! do |potential_pattern|
          @scorer.score(guess, potential_pattern) != score
        end

        # generate new guess
        potential_pattern_count = potential_patterns.length
        possible_guesses = unused_patterns.map do |possible_guess|
          hit_counts = potential_patterns.each_with_object(Hash.new(0)) do |potential_pattern, counts|
            counts[@scorer.score(potential_pattern, possible_guess)] += 1
          end

          highest_hit_count = hit_counts.values.max || 0

          membership_value = potential_patterns.include?(possible_guess) ? 0 : 1

          [highest_hit_count, membership_value, possible_guess]
        end

        guess = possible_guesses.min.last

        guess_count += 1
      end
    end
  end
end

