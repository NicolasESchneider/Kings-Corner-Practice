

class Board
    attr_accessor :king_piles, :standard_piles

    def initialize(deck)
        @deck = deck
        @standard_piles = Array.new(4){Spile.new}
        @king_piles = Array.new(4){Kpile.new}
        start = deck.take(4) 
        #if card.val == 13
        until start.map{|card| card.val }.count(13) == 0 
            start.each do |card|
                #break returns here
                if card.val == 13
                    
                    king = start.delete(card)
                    @king_piles.each do |kpile|
                        if kpile.empty?
                            kpile.stack(king)
                            break
                        end
                    end
                end
            end

            if start.size < 4
                until start.size == 4
                    start += deck.take(1)
                end
            end
                
        end

        @standard_piles.each do |pile|
            pile.stack(start.pop)
        end
        
    end

    def valid_merges
        result_ = []
        piles = @standard_piles + @king_piles
        @standard_piles.each do |pile|
            piles.each do |pyle|
                unless pyle.empty?
                    if pile.valid_merge?(pyle)
                        result_ << [pile, pyle]
                    end
                end
            end
        end
        result_

    end
    
end


