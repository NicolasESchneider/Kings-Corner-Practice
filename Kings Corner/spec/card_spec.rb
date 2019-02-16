require 'card'

describe Card do
    describe '#initialize' do
        it "initializes with a suit and a value" do
            expect {Card.new(:S, 1)}.to_not raise_error   
        end
    end

    describe '#color' do
        card = Card.new(:H,1)
        crd = Card.new(:S,2)
        it "returns the cards color as a symbol" do
            expect(card.color).to eq(:RED)
            expect(crd.color).to eq(:BLACK)
        end

    end   

    describe '#can_stack_on' do
        card1 = Card.new(:H,12)
        card2 = Card.new(:S,13)
        card3 = Card.new(:C,12)
        card4 = Card.new(:C,3)

        it "returns true for a valid stack" do
            #red on black, card1's value is one less than card 2
            expect(card1.can_stack_on?(card2)).to eq(true)
        end
        it "returns false if the cards value is lesser than self.val" do
            expect(card2.can_stack_on?(card1)).to eq(false)
        end
        it "returns false if the card is of the same color" do
            expect(card3.can_stack_on?(card2)).to eq(false)
        end
        it "returns false if the difference between values is greater than 1" do
            expect(card4.can_stack_on?(card1)).to eq(false)
        end


    end
end     