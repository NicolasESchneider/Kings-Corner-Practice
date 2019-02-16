class Hand
    #this is a factory method that should take in a deck and a board
    #it should return a Hand instance
    def self.first_draw(deck, board)
    end

    attr_accessor :cards
    attr_reader :board

    def initialize(cards, board)
    end

    def won?

    end

    def valid_places

    end

    
    def draw
        cards += board.take(1)
    end

    def make_move(card, pile)

    end

end