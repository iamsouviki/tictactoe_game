# Tic Tac Toe

Tic Tac Toe is a Flutter apllication which is made using BackTracking MinMax algorithm.

# MinMax algorithm:

1) Finding the Best Move :

We shall be introducing a new function called findBestMove(). This function evaluates all the available moves using minimax() and then returns the best move the maximizer can make. The pseudocode is as follows : 
 
  function findBestMove(board):
    bestMove = NULL
    for each move in board :
        if current move is better than bestMove
            bestMove = current move
    return bestMove

    
2)  Minimax :

To check whether or not the current move is better than the best move we take the help of minimax() function which will consider all the possible ways the game can go and returns the best value for that move, assuming the opponent also plays optimally 
The code for the maximizer and minimizer in the minimax() function is similar to findBestMove() , the only difference is, instead of returning a move, it will return a value. Here is the pseudocode : 
 

function minimax(board, depth, isMaximizingPlayer):

    if current board state is a terminal state :
        return value of the board
    
    if isMaximizingPlayer :
        bestVal = -INFINITY 
        for each move in board :
            value = minimax(board, depth+1, false)
            bestVal = max( bestVal, value) 
        return bestVal

    else :
        bestVal = +INFINITY 
        for each move in board :
            value = minimax(board, depth+1, true)
            bestVal = min( bestVal, value) 
        return bestVal

## Application ScreenShots

# Splash Screen
![Screenshot_2021-05-27-23-54-28-472_com android chrome](https://user-images.githubusercontent.com/47409900/119878547-e3c73a80-bf47-11eb-9801-a1ccc8f68221.jpg)

# Home Page

![Screenshot_2021-05-27-23-54-33-176_com android chrome](https://user-images.githubusercontent.com/47409900/119879319-baf37500-bf48-11eb-9686-8e761b21a120.jpg)

# Game Play

![Screenshot_2021-05-27-23-54-45-109_com android chrome](https://user-images.githubusercontent.com/47409900/119879421-db233400-bf48-11eb-9cea-2fee4717e59c.jpg)
![Screenshot_2021-05-27-23-54-53-518_com android chrome](https://user-images.githubusercontent.com/47409900/119879449-e1b1ab80-bf48-11eb-9f9a-d4b7a7f8c30e.jpg)
![Screenshot_2021-05-27-23-54-57-093_com android chrome](https://user-images.githubusercontent.com/47409900/119879468-e6765f80-bf48-11eb-9de6-65c122ad1338.jpg)
![Screenshot_2021-05-27-23-55-14-871_com android chrome](https://user-images.githubusercontent.com/47409900/119879486-ea09e680-bf48-11eb-96dd-2c907173924a.jpg)


# Winner Show

![Screenshot_2021-05-27-23-56-38-979_com android chrome](https://user-images.githubusercontent.com/47409900/119879612-09a10f00-bf49-11eb-9da7-f2f4717e380a.jpg)
![Screenshot_2021-05-27-23-55-59-683_com android chrome](https://user-images.githubusercontent.com/47409900/119879636-0e65c300-bf49-11eb-9bde-fbede2e5fd9b.jpg)
![Screenshot_2021-05-27-23-58-02-442_com android chrome](https://user-images.githubusercontent.com/47409900/119879662-158cd100-bf49-11eb-90ac-0796ad944bad.jpg)
![Screenshot_2021-05-27-23-58-22-736_com android chrome](https://user-images.githubusercontent.com/47409900/119879679-1887c180-bf49-11eb-83fe-239ff17fe5f9.jpg)



## Thank You

















