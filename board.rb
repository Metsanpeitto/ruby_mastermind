# The board will consist of a maximun of 12 vetical boxes
# Every box has 4 color cells and 4 circles o 
# numbers from 1 to 6 can beselected
# Circles can have a color or be gray
# Color code [ 
# 1 => Pink 
# 2 => Red 
# 3 => Orange 
# 4 => Yellow 
# 5 => Green
# 6 => Purple ]

require 'colorize'
class Board
  attr_reader :board

  COLOR_CODE  = { 
       "1" => :light_black ,
       "2" => :red ,
       "3" => :light_cyan ,
       "4" => :light_magenta ,
       "5" => :green,
       "6" => :light_blue ,
      }


  def initialize    
   # @board =[ [[1,1,1,1],[nil,nil,nil,nil]]    ]
   @board =[]
  end  


  def display_board
    puts ("Remember | #{"o".green}  RightNum/RightPos | #{"o".light_black}  RightNum/WrongPos ") 
    puts " "
    counter = 1  
    board.each do |box|
    box.each do |b|
       b.each do |l|
        if counter % 2 != 0
          color = COLOR_CODE[l.to_s]      
          print "  #{l}  ".colorize(background: color)
         else
          case l
          when true
              print " o ".green
          when false
              print " o ".light_black 
          else 
              print "   "    
          end 
                   
        end
       end 
       counter += 1
      end 
      puts " "
    end 
  end  

  def check_code(code)  
    puts "Code :#{code} is string? #{code.instance_of? String} The_code: #{$the_code} is string? #{$the_code.instance_of? String}"
    puts @the_code
    if code == $the_code
      $won_flag = true
      puts broken_code
    end  
    right_right = 0
    right_wrong = 0  
    if code.instance_of? String
      arr_try = code.split("") 
      else
       code_s = code.to_s
       arr_try = code_s.split("")
    end   
    
    puts "The code : #{$the_code}"
    the_code_s = $the_code.to_s 
    arr = the_code_s.split("") 
    digit_count = arr.group_by(&:itself) 
    puts "Digit count : #{digit_count}"
    if arr == arr_try
      puts "Won"
      $won_flag = true
    else  

      # Iterate over the arr with the code
      arr.each_with_index {|d,index|
      if d == arr_try[index]
         puts "digit_count[d.to_s] : #{digit_count[d.to_s]}"
         digit_count[d.to_s].pop
         right_right = right_right + 1   
        else          
         arr_try.each do |d1|
         if d1 == d   
          puts "Digit count : #{digit_count}"
          puts "d = #{d}"       
          
          
          if digit_count[d.to_s].size > 0
            digit_count[d.to_s].pop
            right_wrong = right_wrong + 1
          end
         end 
        end  
    end 
    }
    clues = []

    for index in (0..right_right - 1)
       clues.push(true)
    end  
    for index in (0..right_wrong - 1)
       clues.push(false)
    end  

    @board.push([arr_try,clues])
    display_board
  end 
 end  


  def board_state
    puts "Board #{@board}"
     return @board
  end  
end    