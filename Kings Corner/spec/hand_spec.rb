require 'card'
require 'deck'
require 'hand'

describe Hand do
    test_deck = Deck.new_deck
    describe "::first_draw" do

        it "deals a hand of two cards" do
        deck_cards = [
            Card.new(:D, 4),
            Card.new(:D, 4),
            Card.new(:D, 4),
            Card.new(:D, 4),
            Card.new(:D, 4),
            Card.new(:D, 4),
            Card.new(:D, 4)

        ]

        deck = double("deck")
        board = double("board")
        expect(deck).to receive(:take).with(7).and_return(deck_cards)
        hand = Hand.first_draw(deck, board)
        expect(hand.cards).to match_array(deck_cards)
        end
    end

    describe "#won?" do
        x = Hand.first_draw(test_deck, :board)
        y = Hand.new([],:board)
        it "true if hand is empty, false otherwise" do
            expect(x.empty?).to be(false)
            expect(y.empty?).to be(true)
        end
    end
    describe "#valid_places" do
        it "returns a nested array of valid card/pile placements" do 
            test_cards = [Card.new(:D,12),Card.new(:D,13),Card.new(:H,1),Card.new(:D,1),Card.new(:S,1)]
            test_deck = Deck.new(test_cards)
            test_board = Board.new(test_deck)
            test_hand = Hand.new([Card.new(:S,12), Card.new(:C,11)], test_board)
            expect(test_hand.valid_places).to include([test_hand.cards[0],test_board.king_piles[0]], [test_hand.cards[1], test_board.standard_piles[0]])

        end
    end

end


