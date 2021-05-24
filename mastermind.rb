################################################################################################################################################
################################################################################################################################################
#
#        ruby_mastermind
#        Introduction If you’ve never played Mastermind, a game where you have to guess your opponent’s secret 
#          code within a certain number of turns  (like hangman with colored pegs), check it out on Wikipedia. 
#          Each turn you get some feedback about how good your guess was – whether it was 
#          exactly correct or just the correct color but in the wrong space.
#        
#          Assignment Build a Mastermind game from the command line where you have 12 turns to guess the secret 
#          code, starting with you guessing the computer’s random code.
#        
#          Think about how you would set this problem up! Build the game assuming the computer randomly selects the 
#          secret colors and the human player  must guess them. Remember that you need to give the proper feedback on
#          how good the guess was each turn! Now refactor your code to allow  the human player to choose whether they 
#          want to be the creator of the secret code or the guesser. Build it out so that the computer will 
#          guess if you decide to choose your own secret colors. You may choose to implement a computer strategy
#          that follows the rules of the game  or you can modify these rules. If you choose to modify the rules,
#          you can provide the computer additional information about each guess.
#          For example, you can start by having the computer guess randomly, but keep the ones that match exactly.
#          You can add a little bit more intelligence to the computer player so that, if the computer has guessed 
#          the right color but the wrong position, its next guess will need to include that color somewhere.
#          If you want to follow the rules of the game, you’ll need to research strategies for solving 
#          Mastermind, such as this post. Post your solution below! Additional Resources This section
#          contains helpful links to other content. 
#          It isn’t required, so consider it supplemental for if you need to dive deeper into something.
#        
#          Not directly helpful, but here are some Ruby game libraries for fun.     
#
################################################################################################################################################
################################################################################################################################################


# puts " 1 ".colorize(background: :blue)
# puts "o".red

# There is a Code_breaker and a Code_maker
# There is a Board with 12 boxes (1 per turn)
# When a new box is created it has
#  4 cells and 4 circles
# To start create players
# The code maker inputs a 4 digit number
# The code breaker inputs a 4 digit number
# The pc compares the input with the code
# The pc replies with a full color circle for
#  every right number in the right position
# The pc replies with a empty color circle for
#  every right number in a wrong position
# After 12 turns the Code_maker wins if the
#  Code_breaker couldn't find out the code


require 'colorize'
require_relative 'game.rb'

def main 
    Game.new    
end   

main