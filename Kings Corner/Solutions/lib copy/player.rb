class Player
    attr_reader :board
    attr_reader :hand

    def initialize(name, deck, board)
        @name, @deck, @board = name, deck, board
        @hand = Hand.first_draw(deck, board)

    end

    def get_valid_moves
        hand.valid_places + board.valid_merges
    end

    def end_turn
        hand.draw
    end

    

    def make_move(pard, pile)
        raise 'Thats not a valid move' if !get_valid_moves.include?([pard,pile])
        if pard.is_a?(Card)
            hand.make_move(pard, pile)
        else
            pard.merge(pile)
        end
    end
end