require 'deck'
require 'card'

describe Deck do
    describe "::new_deck" do
        subject(:new_) {Deck.new_deck}

        it "starts with 52 cards" do
            expect(new_.count).to eq(52)
        end

        it "returns all cards W/O duplicates" do 
            vals = new_.cards.map{|card| card.val}.uniq
            suit = new_.cards.map{|card| card.suit}.uniq
            check = vals.product(suit)
            truth = (1..13).to_a.product(Card.suits).sort
            expect(check.sort).to eq(truth)
        end
        it "Returns a new deck object" do 
            expect(Deck.new_deck).to be_a(Deck)
        end

    end
    let(:cards) do
    cards = [
      Card.new(:S, 13),
      Card.new(:S, 12),
      Card.new(:S, 11)
    ]
    end
    describe "#initialize" do 

        it "Accepts an array of card objects" do
            testing = Deck.new(cards)
            expect{testing}.to_not raise_error
            expect(testing.count).to eq(3)
        end


    end
    describe "#take" do 
        

        it "Should pop cards from the top. USE POP OR IT BREAKS" do 
                cards_ = [
            Card.new(:S, 13),
            Card.new(:S, 12),
            Card.new(:S, 11)
            ]
            x = Deck.new(cards_)
            res = x.cards.last
            expect(x.take(1)).to eq([res])
            res2 = x.cards[0..1]
            expect(x.take(2)).to eq(res2)
        end

        it "POPS cards from deck on take" do
            y = Deck.new(cards)
            y.take(2)
            expect(y.count).to eq(1)
        end

        it "doesn't allow you to take more cards than are in the deck" do
            x = Deck.new_deck
            expect do
                x.take(400)
            end.to raise_error("not enough cards")
        end
        
    end

end