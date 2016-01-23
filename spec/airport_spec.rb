require 'airport.rb'

describe Airport do
  let(:plane) { double :plane }

  describe '#clearance?' do
    it 'returns clearance as true' do
      expect(subject.clearance?).to eq true
    end
  end
  describe '#plane_lands' do
    it 'a plane lands and it stored at the airport' do
      pl = Plane.new
      pl.request_clearance(subject)
      expect(subject.plane_lands(plane)).to eq landed_planes
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
