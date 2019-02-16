require 'board'
require 'pile'
require 'deck'
require 'card'

describe Board do
    boardtest = Board.new(Deck.new_deck)
    describe "#initialize" do
        it "creates 4 standard and 4 King piles" do
            expect(boardtest.king_piles.size).to eq(4)
            expect(boardtest.standard_piles.size).to eq(4)
            expect(boardtest.king_piles.count{|p| p.is_a?(Kpile)}).to eq(4)
            expect(boardtest.standard_piles.count{|p| p.is_a?(Spile)}).to eq(4)
        end
        it "places 1 card at the top of each standard pile" do
            expect(boardtest.standard_piles.count{|pile| pile.size == 1}).to eq(4)
        end
        it "places kings on the top of an empty king pile and replaces them" do
            test_cards = [Card.new(:D,12),Card.new(:D,13),Card.new(:D,12),Card.new(:D,12),Card.new(:D,12)]
            test_deck = Deck.new(test_cards)
            test_board = Board.new(test_deck)
            expect(test_board.standard_piles.count{|pile| pile.size == 1}).to eq(4)
            expect(test_board.king_piles.count{|pile| pile.size == 1}).to eq(1)
            expect(test_deck.count).to eq(0)
        end
    
    end
    describe "#valid_merges" do
        it "returns a nested array of possible pile merges" do
            test_cards = [Card.new(:D,12),Card.new(:D,13),Card.new(:H,12),Card.new(:D,12),Card.new(:S,12)]
            test_deck = Deck.new(test_cards)
            test_board = Board.new(test_deck)
            expect(test_board.valid_merges).to eq([[test_board.standard_piles[1],test_board.king_piles[0]]])
        end


    end


end