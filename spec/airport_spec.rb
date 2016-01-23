require 'airport.rb'

describe Airport do
  let(:plane) { double :plane }

  describe '#clearance?' do
    it 'returns clearance as true' do
      expect(subject.clearance?).to eq true
    end
  end
  describe '#plane_lands' do
    it 'a plane lands and it is stored at the airport' do
      # pl = Plane.new
      # pl.request_clearance(subject)
      landed_planes = [plane]
      expect(subject.plane_lands(plane)).to eq landed_planes
    end

    it 'returns an error if a plane does not have clearance to land' do
      allow(plane).to receive(:clearance).and_return(false)
      expect{subject.plane_lands(plane)}.to raise_error "Plane does not have clearance to land"
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
