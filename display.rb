# Text needed to Tic-Tac-Toe
module Display

  def  welcome_text
    "Welcome to the game !! "  
  end  

  def  intro_text 
    text = %Q(
      ---------  Welcome to the game !!  ---------------

      To play this game you can asume the rol of a Code Maker or a Code Breaker.

      As Code Maker you have to choose a number of 4 digits and each one of those digits 
      must be from 1 to 6, both included. 
      Example = 1111

      As Code Breaker you have to find out that 4 digit number.
      To do that you have input codes a maximun of 12 turns.
      After every input you can receive a maximun of 4 clues in the form of 'o'

        - Green 'o' means that a number in the last input is actually present in 'The Code'
        and this number is also in the right position.
        - Light Black 'o' means a number in the last input is actually present in 'The Code'
        but this number is in a wrong position.
        - The lack of any 'o' means that no number in the last input is actually present in 'The Code' 
    )
    return text
  end

  def intro_question
    "Do you want to be the Code Maker (type CM) or the Code Breaker (type CB)"
  end  

  def maker_question_text_1
    "Please, type 'The Code' . A 4 digit number, with numbers from 1 to 6, both included"
  end  

  def maker_question_text_2_ok
    "OK! The input code is valid."
  end 

  def maker_question_text_2_no
    "Not a valid code. It has to be a 4 digit number, with numbers from 1 to 6, both included"
  end   

  def maker_question_text_3
    "Now let'see if the pc can break it.Press any key to start"
  end

  def start_breaker_text
    "Try a 4 digit number, with numbers from 1 to 6, both included"
  end  

  def broken_code
    "The code was broken"
  end  
end