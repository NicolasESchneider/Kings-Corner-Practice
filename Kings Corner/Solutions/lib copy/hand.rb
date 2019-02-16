class Hand
    #this is a factory method that should take in a deck and a board
    #it should return a Hand instance
    def self.first_draw(deck, board)
        Hand.new(deck.take(7), board)
    end
    attr_accessor :cards
    attr_reader :board
    def initialize(cards, board)
        @cards = cards
        @board = board
    end

    def won?
        cards.empty?
    end

    def valid_places
        res = []
        piles = board.king_piles + board.standard_piles
        cards.each do |card|
            piles.each do |pile|
                if pile.valid_move?(card)
                    res << [card, pile]
                end
            end
        end
        res
    end

    
    def draw
        cards += board.take(1)
    end

    def make_move(card, pile)
        hand.cards.delete(card)
        pile.stack(card)
    end

end