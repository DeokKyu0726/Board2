package com.example.myproject.view;

import com.example.myproject.model.Board;

public class BoardView {

    private String title;
    private String content;

    public static BoardView convert(Board board) {
        BoardView boardView = new BoardView();

        boardView.content = board.getContent();
        boardView.title = board.getTitle();

        return boardView;
    }

}
