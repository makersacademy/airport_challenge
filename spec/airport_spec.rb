require 'airport.rb'

describe Airport do
  let(:plane) { double :plane }

  describe '#clear_to_land' do
    it 'gives clearance for a plane to land at the airport' do
      expect(subject.clear_to_land).to eq true
    end
  end






end


# # let(:bike) { double :bike }
# # # bike = double(:bike, broken?: true)
#
# def stormy?
#   number = rand(0..2)
#   number == 0 ? true:false
# end
#
# p stormy?
