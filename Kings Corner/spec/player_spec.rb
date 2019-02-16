require 'deck'
require 'player'
require 'card'
require 'board'
require 'pile'


describe Player do

    describe "#initialize" do
        it "takes a name, deck, and board" do
            expect{todd = Player.new("todd", test_deck, test_board)}.to_not raise_error
        end

        it "calls Hand::first_draw" do
            test_cards = [Card.new(:D, 4), Card.new(:D, 4),Card.new(:D, 4),Card.new(:D, 4),Card.new(:D, 4),Card.new(:D, 4),Card.new(:D, 4), Card.new(:D,12),Card.new(:D,13),Card.new(:D,12),Card.new(:D,12),Card.new(:D,12)]
            test_deck = Deck.new(test_cards)
            test_board = Board.new(test_deck)
            todd = Player.new("todd", test_deck, test_board)
            expect(todd.hand.cards.map{|card| card.val}.sum).to eq(28)
        end
            
    end

    describe "#get_valid_moves" do
        it "returns a nested array of all possible moves and merges" do
            test_cards = [Card.new(:S,1),Card.new(:S,1), Card.new(:C,11),Card.new(:S,1),Card.new(:S,1),Card.new(:S,1),Card.new(:S,1),
            Card.new(:D,12),Card.new(:D,13),Card.new(:H,1),Card.new(:D,1),Card.new(:S,12)]
            test_deck = Deck.new(test_cards)
            test_board = Board.new(test_deck)
            todd = Player.new("todd", test_deck, test_board)
            expect(todd.get_valid_moves).to include([test_board.standard_piles[1],test_board.king_piles[0]],[todd.hand.cards[2],test_board.standard_piles[0]])
        end




    end


end