#die 
require 'airport.rb'

describe Airport do 
 it "airport.new creates a new airport" do
  expect(Airport.new).to be_instance_of Airport
 end 
end 
# describe Dice do 
#     let(:subject) { described_class.new }
#      it "dice.new creates new dice object" do
#         expect(Dice.new).to be_instance_of Dice 
#       end
#        it "returns a random number from 1-6" do 
#         expect(subject.numbers).to receive(:sample).and_return(12345)
#         expect(subject.random).to eq 12345
#     end
#   end 
