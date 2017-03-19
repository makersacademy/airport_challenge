require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do

    it { is_expected.to respond_to(:land).with(1).argument }
    it 'lands the plane' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end
    context "when initialized with no capacity" do
      it 'raises an error when the default capacity has been reached' do
        described_class::DEFAULT_CAPACITY.times {airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "The airport is full"
      end
    end
    context "when initialized with capacity" do
      it 'raises an error when the given capacity has been reached' do
        airport = Airport.new(50)
        50.times { airport.land(plane) }
        expect{ airport.land(plane) }.to raise_error "The airport is full"
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
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it 'instruct a landed plane to take_off' do
      airport.land(plane)
      allow(airport).to receive_message_chain(:weather, stormy?: false)
      expect(airport.take_off(plane)).to eq plane
    end
    context 'when plane not at airport' do
      it 'raises an error if there is no such plane at the airport' do
        expect{ airport.take_off(plane) }.to raise_error "The plane can't be found at the airport"
      end
    end
    context 'when weather conditions do not permit flying' do
      it 'raises an error if the weather is stormy' do
        # weather = double("weather", :stormy? => true)
        airport.land(plane)
        allow(airport).to receive_message_chain(:weather, stormy?: true )
        expect { airport.take_off(plane) }.to raise_error "Stormy weather. No planes flying."
      end
    end
  end
end
