class GamePlayCode {
  String bot="";
  String player="";

  initLetter(String bot,String player){
    this.bot = bot;
    this.player=player;
  }

  printPlayer(){

  }

  var board = {
    1: ' ',
    2: ' ',
    3: ' ',
    4: ' ',
    5: ' ',
    6: ' ',
    7: ' ',
    8: ' ',
    9: ' '
  };

  checkWhichMarkWon(mark){
    if( (board[1] == board[2]) && (board[1] == board[3]) && (board[1] == mark)){
      return true;
    }else{
      if((board[4] == board[5])&&(board[4] == board[6])&&(board[4] == mark)){
        return true;
      }else{
        if((board[7] == board[8])&&(board[7] == board[9])&&(board[7] == mark)){
          return true;
        }else{
          if((board[1] == board[4])&&(board[1] == board[7])&&(board[1] == mark)){
            return true;
          }else{
            if((board[2] == board[5])&&(board[2] == board[8])&&(board[2] == mark)){
              return true;
            }else{
              if((board[3] == board[6])&&(board[3] == board[9])&&(board[3] == mark)){
                return true;
              }else{
                if((board[1] == board[5])&&(board[1] == board[9])&&(board[1] == mark)){
                  return true;
                }else{
                  if((board[7] == board[5])&&(board[7] == board[3])&&(board[7] == mark)){
                    return true;
                  }else{
                    return false;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  checkforWin(){
    if( (board[1] == board[2]) && (board[1] == board[3]) && (board[1] != ' ')){
      return true;
    }else{
      if((board[4] == board[5])&&(board[4] == board[6])&&(board[4] != ' ')){
        return true;
      }else{
        if((board[7] == board[8])&&(board[7] == board[9])&&(board[7] != ' ')){
          return true;
        }else{
          if((board[1] == board[4])&&(board[1] == board[7])&&(board[1] != ' ')){
            return true;
          }else{
            if((board[2] == board[5])&&(board[2] == board[8])&&(board[2] != ' ')){
              return true;
            }else{
              if((board[3] == board[6])&&(board[3] == board[9])&&(board[3] != ' ')){
                return true;
              }else{
                if((board[1] == board[5])&&(board[1] == board[9])&&(board[1] != ' ')){
                  return true;
                }else{
                  if((board[7] == board[5])&&(board[7] == board[3])&&(board[7] != ' ')){
                    return true;
                  }else{
                    return false;
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  checkDraw(){
    for(int i=1;i<10;i++){
      if(board[i]==' '){
        print('false'+board[i].toString());
        return false;
      }
      return true;
    }
  }

  playerMove(int position){
    insertletter(player, position);
    //computerMove();
    if(!checkWhichMarkWon(player)) {
      computerMove();
    }
  }

  playerMoveFriends(String ply,int pos){
    insertletter(ply, pos);
  }

  computerMove(){
    int bestScore = -800;
    int bestMove = 0;
    int score = 0;

    for(int i=1;i<10;i++){
      if (board[i] == ' '){
        board[i] = bot;
        score = minimax(board, 0, false);
        board[i]=' ';
        if (score > bestScore){
          bestScore = score;
          bestMove = i;
        }
      }
    }

    insertletter(bot, bestMove);

  }

  int minimax(Map<int, String> board, int depth, bool isMaximizing) {

    if (checkWhichMarkWon(bot)){
      return 1;
    }else{
      if(checkWhichMarkWon(player)){
        return -1;
      }else{
        if(checkDraw()){
          return 0;
        }
      }
    }

    if (isMaximizing){
      int bestScore = -800;
      int score = 0;

      for(int i=1;i<10;i++){
        if (board[i] == ' '){
          board[i] = bot;
          score = minimax(board, 0, false);
          board[i]=' ';
          if (score > bestScore){
            bestScore = score;
          }
        }
      }

      return bestScore;

    }else{
      int bestScore = -800;
      int score = 0;

      for(int i=1;i<10;i++){
        if (board[i] == ' '){
          board[i] = bot;
          score = minimax(board, 0, true);
          board[i]=' ';
          if (score > bestScore){
            bestScore = score;
          }
        }
      }

      return bestScore;
    }


  }

  insertletter(String ply,int postition){
      if(board[postition]==' '){
        board[postition]=ply;
      }
  }


}


