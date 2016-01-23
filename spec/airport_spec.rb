require 'airport.rb'

describe Airport do
  let(:plane) { double :plane }

  describe '#clear_to_land' do
    it 'instructs a plane to land at the airport' do
      expect(subject.clear_to_land(plane)).to include plane
    end
  end

  describe '#landed_planes' do
    it 'keeps track of planes that have landed at the airport' do
      subject.clear_to_land(plane)
      expect(subject.landed_planes).to include plane
    end
  end

  describe 'clear_to_takeoff' do
    it 'instructs a plane to takeoff and removes it from the landed planes array' do
      subject.clear_to_land(plane)
      subject.clear_to_takeoff
      expect(subject.landed_planes).not_to include plane
    end

    it 'raises an error if there are no planes to takeoff' do
      expect{subject.clear_to_takeoff}.to raise_error 'There are no planes at the airport'
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
