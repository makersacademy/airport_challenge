require 'airport'
require 'plane'

describe Airport do
  plane = Plane.new
  it { is_expected.to respond_to :bay_available? }
  # describe '#stormy?' do
  #   it 'warns us of the weather' do
  #     expect(weather).to be_stormy
  it { is_expected.to respond_to :stormy? }

  # airport records a new plane when it lands in sunny weather.
  describe "#landing" do
    it '.landing' do
      expect(subject.landing(plane)).to eq 'successful landing'
    end
  end

  # airport loses a plane when it takes off in sunny weather.
  describe '#takeoff' do
    it 'loses a plane from the landing bay' do
      # we expect that when a plane takes off, @bays_available is increased by 1
      # how to read an instance variable from outside?
      expect(subject.takeoff(plane)).to eq 'successful takeoff'
    end
  end

  describe '#bays_occopied_count' do
    it 'adds one when a plane lands, and minus one when a plane takes off' do
      expect(subject.takeoff(plane)).to change{bays_occopied_count}.by(1)
      expect(subject.landing(plane)).to change{bays_occopied_count}.by(-1)
    end
  end


  # If there are no landing bays available, it raises an error
  describe '#bay_available?' do
    it 'raises an error when there are no landing bays available' do
      expect(subject.bay_available?).to raise_error 'No bays available to land'
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
