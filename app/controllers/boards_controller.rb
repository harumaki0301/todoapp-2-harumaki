class BoardsController < ApplicationController
  def index
    @board = Board.first
  end
end
