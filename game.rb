require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'ai.rb'

class Game 
    include Display
    include Ai
    attr_reader :the_code, :won_flag


  def initialize
    $won_flag = false
    $the_code = []
    intro
  end  

  def intro
    puts welcome_text  
    puts intro_text
    puts intro_question
    response = gets.chomp
    response.downcase!

    case response
    when "cm"
      start_maker
    when "cb"
      start_breaker       
    end

  end 
  
  def start_maker
    input_done = false
    @new_board = Board.new
    while input_done == false
      puts maker_question_text_1
      this_code = gets.chomp
      this_code = this_code.split("")
      num = [] 
      
      this_code.each do |n|
      valid_digits = [1,2,3,4,5,6]
       if valid_digits.include?(n.to_i)
           num.push(n.to_i)

       end  
       
       if num.size == 4
          puts "Num : #{num}"    
          i = num.join.to_i   

          $the_code = i
          puts maker_question_text_2_ok
          puts maker_question_text_3
          pressed = gets.chomp
          input_done = true   
       end
      end   
    end 
    pc_breaker

  end  

  def start_breaker
    puts "Num #{num}"
    $the_code = 1122
    @new_board = Board.new

    while $won_flag == false
      puts start_breaker_text
      this_code = gets.chomp
      puts this_code.instance_of? String
      @new_board.check_code(this_code)  
    end      
  end
  
  def generate_code   
    code = []  
    code_arr = []
    for index in 0..3
      random_number = rand 1..6
      code.push(random_number)   
      code_arr.push(random_number)
    end  
    puts "Generated : #{code}"
    codes = {:code => code, :code_arr => code_arr } 
    return codes
    end  
  
  def pc_breaker
     loop_counter = 0 
     while ($won_flag == false) && (loop_counter < 12)
       code = think_movement        
     end 
     if $won_flag != false
      puts "You Win and the Computer loses!"
      $won_flag = true
     end      
  end  
  


end    