require 'pile'
require 'card'
require 'board'
describe Pile do
    testcard = Card.new(:D,4)
    testpile = Pile.new
    testcard2 = Card.new(:S,3)
    testpile2 = Spile.new
    kpop = Kpile.new
    kingtest = Card.new(:H,13)
    spop = Spile.new

    describe '#initialize' do
        
        
        it "initializes @pile as an empty array" do
            expect(testpile.pile).to eq([])
        end
    end
    describe "#empty?" do
        it "I shouldnt have to explain to you what this method does at this point" do
            expect(testpile.empty?).to be(true)
        end
    end
    describe "#stack" do
        it "accepts a card as an argument" do
            expect{testpile2.stack(testcard)}.to_not raise_error
        end
        it "places the card at the top of the stack" do
            testpile2.stack(testcard)
            expect(testpile2.pile[0]).to be(testcard)
        end
    end
    describe "#peak" do
        it "returns the card at the top of the pile" do
            testpile2.stack(testcard)
            testpile2.stack(testcard2)
            expect(testpile2.peak).to be(testcard2)
        end
    end
    describe "#bottom" do
        it "returns the card at the bottom of the pile" do
            testpile2.stack(testcard)
            testpile2.stack(testcard2)
            expect(testpile2.bottom).to be(testcard)
        end

    end
    describe Kpile do
        it 'is a child of the Pile class' do
            expect(kpop.is_a?(Pile)).to eq(true)
        end
        describe "#valid_move?" do
            it 'takes a card as an argument' do
                expect{kpop.valid_move?(testcard)}.to_not raise_error
            end
            it 'returns false if empty and card is not a king' do
                expect(kpop.valid_move?(testcard)).to eq(false)
            end
            it 'returns true if empty and card is a king' do
                expect(kpop.valid_move?(kingtest)).to eq(true)
            end
            it 'returns true for valid moves' do
                kpop.stack(testcard)
                expect(kpop.valid_move?(testcard2)).to eq(true)
            end
            it 'returns false for invalid moves' do
                kpop.stack(testcard)
                expect(kpop.valid_move?(kingtest)).to eq(false)
            end
        end
    end
    describe Spile do 
        it 'is a child of the Pile class' do
            expect(spop.is_a?(Pile)).to eq(true)
        end
        describe "#valid_move?" do
            it 'takes a card as an argument' do
                expect{spop.valid_move?(testcard)}.to_not raise_error
            end
            it 'returns true if empty' do
                expect(spop.valid_move?(testcard)).to eq(true)
            end
            it 'returns true for valid moves' do
                spop.stack(testcard)
                expect(spop.valid_move?(testcard2)).to eq(true)
            end
            it 'returns false for invalid moves' do
                spop.stack(testcard)
                expect(spop.valid_move?(kingtest)).to eq(false)
            end
        end

        describe "#valid_merge?" do
            it "returns true if pile can be placed on argument" do
                stack1 = Spile.new
                stack2 = Spile.new
                stack1.stack(Card.new(:D,6))
                stack2.stack(Card.new(:S,7))
                expect(stack1.valid_merge?(stack2)).to eq(true)
            end
            it "returns false otherwise" do
                stack1 = Spile.new
                stack2 = Spile.new
                stack1.stack(Card.new(:D,6))
                stack2.stack(Card.new(:S,8))
                expect(stack1.valid_merge?(stack2)).to eq(false)
            end
        end

        describe "#merge" do
                stack1 = Spile.new
                stack2 = Spile.new
                stack1.stack(Card.new(:D,6))
                stack2.stack(Card.new(:S,7))
            it "should change both stacks piles to reflect the merge" do
                stack1.merge(stack2)
                expect(stack1.pile).to eq([])
                expect(stack2.pile[0].val).to eq(7)
                expect(stack2.pile[-1].val).to eq(6)
            end
        end
    end
    




end



