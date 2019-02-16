class Card

    VAL_HASH = {
        1 => :ACE,
        2 => :TWO,
        3 => :THREE,
        4 => :FOUR,
        5 => :FIVE,
        6 => :SIX,
        7 => :SEVEN,
        8 => :EIGHT,
        9 => :NINE,
        10 => :TEN,
        11 => :JACK,
        12 => :QUEEN, 
        13 => :KING 
    }.freeze

    attr_reader :suit, :val

    CARD_COLOR = {
        :H => :RED,
        :D => :RED,
        :S => :BLACK,
        :C => :BLACK
    }
    SUITS = [:H,:D,:S,:C].freeze
    def self.suits
        SUITS
    end
    #USE INTEGERS FOR VALUES
    def initialize(suit, val)
        @suit = suit
        @val = val

    end

    def color
        CARD_COLOR[self.suit]
    end

    def can_stack_on?(other_card)
        return false if color == other_card.color
        return false unless other_card.val - val == 1
        true
    end
    


end