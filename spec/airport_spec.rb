require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it 'lands the plane' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include plane
    end
    context "when initialized with no capacity" do
      it 'raises an error when the default capacity has been reached' do
        described_class::DEFAULT_CAPACITY.times {airport.land(Plane.new) }
        expect { airport.land(Plane.new) }.to raise_error "The airport is full"
      end
    end
    context "when initialized with capacity" do
      it 'raises an error when the given capacity has been reached' do
        airport = Airport.new(50)
        airport.capacity.times { airport.land(Plane.new) }
        expect{ airport.land(Plane.new) }.to raise_error "The airport is full"
      end
    end
    # it 'does not allow planes to land when weather is stormy' do
    #   weather = Weather.new
    #   expect { airport.land(Plane.new) }.to raise_error "Weather is stormy and you cannot land"
    # end
  end

  describe '#planes' do
    it { is_expected.to respond_to(:planes) }
    it 'returns the landed planes' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'instruct a landed plane to take_off' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq plane
    end
    context 'plane not at airport' do
      it 'raises an error if there is no such plane at the airport' do
        expect{ airport.take_off(Plane.new) }.to raise_error "The plane can't be found at the airport"
      end
    end
    # it 'raises an error if there are no planes' do
    #   expect{airport.take_off}.to raise_error "No planes at the airport"
    # end
  end

  # describe '#get_forecast' do
  #   it { is_expected.to respond_to(:get_forecast).with(1).argument }
  #   it '' do
  #
  #   end
  # end

end
