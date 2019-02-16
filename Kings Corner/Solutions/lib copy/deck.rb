require_relative 'card'

class Deck
    

    attr_reader :cards
    #this is a factory method
    def self.new_deck
        cards = []
        suits = Card.suits
        vals = (1..13).to_a
        suits.each do |suit|
            vals.each do |val|
                cards << Card.new(suit, val)
            end
        end
        Deck.new(cards)
    end

    def initialize(cards)
        @cards = cards
    end
    
    def count 
        @cards.count
    end

    def take(n)
        raise "not enough cards" if n > count
        @cards.pop(n)
    end
    


end