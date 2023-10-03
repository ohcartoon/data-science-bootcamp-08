# Pao Ying Chub Game

play_game <- function(){
  
  print("Welcome to Pao Ying Chub Game")
  
  user_score <- 0
  bot_score <- 0
  round <- 0
  win <- 0
  lose <- 0
  draw <- 0

  cat("Please select your move: \n- r for rock, \n- p for papar, \n- s for scissors.\n")
  cat("If you want to exit the game, please select 'quit'.\n")
  
  while(TRUE){

    # user choice
    cat("\nYour choice: ")
    user_move <- readLines("stdin", n = 1)

    # bot choice
    bot_move <- sample(c("r", "p", "s"), 1)
    cat(paste("Bot's choice: ", bot_move))
    
    if(user_move == "quit"){
      cat("\nNumber of Rounds: ", round)
      cat(paste("\nWin: ", win, " | Lose: ", lose, " | Draw: ", draw))
      cat("\nBye bye. Hope to see you again! :)")
      break
    } else if (user_move == bot_move){
      round <- round + 1
      draw <- draw + 1
      print("Draw!")
    } else if (user_move == "r" & bot_move == "s"){
      user_score <- user_score + 1
      round <- round + 1
      win <- win + 1
      print("You win!")
    } else if (user_move == "r" & bot_move == "p"){
      bot_score <- bot_score + 1
      round <- round + 1
      lose <- lose + 1
      print("You lose!")
    } else if (user_move == "p" & bot_move == "r"){
      user_score <- user_score + 1
      round <- round + 1
      win <- win + 1
      print("You win!")
    } else if (user_move == "p" & bot_move == "s"){
      bot_score <- bot_score + 1
      round <- round + 1
      lose <- lose + 1
      print("You lose!")
    } else if (user_move == "s" & bot_move == "p"){
      user_score <- user_score + 1
      round <- round + 1
      win <- win + 1
      print("You win!")
    } else if (user_move == "s" & bot_move == "r"){
      bot_score <- bot_score + 1
      round <- round + 1
      lose <- lose + 1
      print("You lose!")
    } else {
      print("Please re-check your choice.")
    }
  }
}

play_game()
