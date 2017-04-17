require 'airport'
require 'plane'

describe Airport do
  subject(:airport) {described_class.new }
  airport = Airport.new
  plane = Plane.new

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        airport.request_landing(plane)
      end
    end
  end


  context '#request_landing' do
    it { is_expected.to respond_to(:request_landing).with(1).arguments }
    it 'tells plane it can land' do
      expect(airport.request_landing(plane)).to eq 'The plane has landed'
    end

  end

  context '#request_take_off' do
    it { is_expected.to respond_to(:request_take_off).with(1).arguments }
    it 'tells plane it can take off' do
      expect(airport.request_take_off(plane)).to eq 'The plane has taken off'
    end
  end

  context '#full?' do
    it { is_expected.to respond_to :full? }
    airport = Airport.new
    it 'checks to see if capacity is full' do
      expect(airport.full?).to eq 'full'
    end
  end

end
