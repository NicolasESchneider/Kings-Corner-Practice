
class Pile
    attr_accessor :pile
    def initialize
        @pile = []
    end

    def peak
        @pile.last
    end

    def bottom
        @pile.first
    end

    def empty?
        @pile.empty?
    end

    def stack(card)
        @pile << card
    end
    def size
        @pile.size
    end
end

class Kpile < Pile

    def valid_move?(card)
        if empty? && card.val != 13
            false
        elsif empty? && card.val == 13
            true
        else
            card.can_stack_on?(peak)
        end
    end


end

class Spile < Pile
    def valid_move?(card)
        if empty? 
            true
        else
            card.can_stack_on?(peak)
        end
    end

    def valid_merge?(other_pile)
        bottom.can_stack_on?(other_pile.peak)
    end

    def merge(other_pile)
        other_pile.pile += @pile
        @pile = []
    end

    
end