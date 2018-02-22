require 'pry'
require_relative '../player.rb'
require_relative '../board.rb'
require_relative '../game.rb'
module Players

  class Computer < Player


    def move(board)
      if check_for_wins(board)
        return check_for_wins(board).to_s
      elsif !board.taken?("5")
        return "5"
      else
        for i in 1..9 do
          if !board.taken?(i.to_s)
            return i.to_s
            break
          end
        end
      end
    end

    def other_token
      if token == "X"
        "O"
      else
        "X"
      end
    end

    def check_for_wins(board)
      winner = nil
      Game::WIN_COMBINATIONS.each do |combo|
        if combo.select{|c| board.cells[c] == token}.size == 2
          if combo.select{|c| board.cells[c] == other_token}.size == 0
            winner = combo.select{|c| board.cells[c] == " "}[0]
            break
          end
        end
      end
      winner + 1
    end


  end

end

robot = Players::Computer.new("X")
test_board = Board.new
test_board.cells = ["X", " ", " ", " ", " ", " ", " ", " ", " "]
t = robot.move(test_board)
binding.pry
