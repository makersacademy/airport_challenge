require 'airport.rb'

describe Airport do
  let(:plane) { double :plane }

  describe '#clear_to_land' do
    it 'gives clearance for a plane to land at the airport' do
      plane = Plane.new
      subject.clear_to_land()
    end
  end

  describe '#plane_lands' do
    it 'lets a plane lane when it has clearance' do
      landed_planes = [plane]
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
