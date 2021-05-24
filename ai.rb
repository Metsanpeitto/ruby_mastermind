# This is the logice behind the pc thinking for movements.
# think_movement receives the state of the board with the history of
# movements.
#
# From that history and the analysis of the clues it should be possible to guess
# the number.
#
# If there is no clues in a round, it means all those 4 digits can be blacklisted
# so only 2 digits last.
#
# If there is green clues, make sure where they are placed. 
# This can take more than a round, Swap values and if the green clue dissapeared, it
# means that the last index was the right one. Then return the index to its last value 
# and store this number in the right index of the 'white-list'

# Black list for numbers that no appear
# White list for numbers in fixed positions
# Gray list for numbers that appear but don't know the position

# Hot to know? [2,3,4,5] => 
#         [2,1,1,4][Gre,Gra]   Swap first number for a digit non present : 
#                              i2modify=0 value = arr[i2modify] ---> arr[i2modify] = value + 1; gre_clue_last = 1 gra_clue_last = 1 board_last : board
#         [3,1,1,4][Gra, Gra]  If a Gre dissapears set flag to return number in that index back : 
#                              if  gre_clue_last > gre_clue then flag_back = true
#                              If a Gra appears add that number and index(negated) to the gray list to a gray list 
#                              gray_list_add(num,index)
#                              Gray List["num"][index] = false
#                              
require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'ai2.rb'

require_relative "ai2"


module Ai
   def think_movement 
     runner = Ai2::Runner.new
     runner.run
   end 
end