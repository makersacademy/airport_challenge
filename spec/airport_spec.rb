require 'airport'
require 'plane'

describe Airport do

  # describe '#initialize' do
  #
  # end

  describe '#stormy?' do
    it { is_expected.to respond_to :stormy? }
  end

  describe '#takeoff' do
    it { is_expected.to respond_to :takeoff }
    it 'loses a plane from the landing bay when plane takesoff' do
      airport = Airport.new
      airport.landing(Plane.new)
      !(airport.stormy?)
      expect(airport.takeoff).to eq 'successful takeoff'
    end

    it 'raises an error when the airport has no planes' do
      airport = Airport.new
      airport.stormy?
      expect { airport.takeoff }.to raise_error 'No planes available'
    end

    it 'raises an error when the weather is stormy' do
      airport = Airport.new
      airport.landing(Plane.new)
      airport.should be_stormy
      expect { airport.takeoff }.to raise_error 'Weather is stormy'
    end
  end

  describe "#landing" do
    it { is_expected.to respond_to(:landing).with(1).argument }
    it 'adds a plane to the landing bay when plane lands' do
      plane = Plane.new
      airport = Airport.new
      airport.should_not be_stormy
      subject.landing(plane)
      expect(subject.landing(plane)).to eq 'successful landing'
    end

    it 'raises an error when the airport is full' do
      subject.capacity.times { subject.landing(Plane.new) }
      expect { subject.landing(Plane.new) }.to raise_error 'No bays available'
    end

    it 'raises an error when the weather is stormy' do
      airport = Airport.new
      airport.should be_stormy
      expect { airport.landing(Plane.new) }.to raise_error 'Weather is stormy'
    end
  end

end

# require 'airport'
# require 'plane'
#
# describe Airport do
#   # airport = Airport.new
#   it { is_expected.to respond_to :land_plane }
#   it '.able_to_land?' do
#     plane = subject.land_plane
#     expect(plane).to be_able_to_land
#   end
#
#   it { is_expected.to respond_to :stormy? }
# end
#
# describe Plane do
#   it { is_expected.to respond_to :able_to_land? }
#   it { is_expected.to respond_to :able_to_takeoff? }
# end
