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
    context "when capacity has been given" do
      it 'raises an error when the capacity has been reached' do
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

  describe '#plane' do
    it { is_expected.to respond_to(:planes) }
    it 'returns the landed plane' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }
    it 'instruct a landed plane to take_off' do
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off).to eq plane
    end
    it 'raises an error if there are no planes' do
      expect{airport.take_off}.to raise_error "No planes at the airport"
    end
  end

  # describe '#get_forecast' do
  #   it { is_expected.to respond_to(:get_forecast).with(1).argument }
  #   it '' do
  #
  #   end
  # end

end
