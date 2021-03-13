package com.example.myproject.views;

import com.example.myproject.model.Board;
import com.example.myproject.view.BoardView;

public class BoardControlView {

    private BoardView boardView;

    public static BoardControlView convert(Board board)
    {
        BoardControlView boardControlView = new BoardControlView();

        boardControlView.boardView = BoardView.convert(board);


        return boardControlView;
    }



}
