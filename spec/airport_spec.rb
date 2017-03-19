require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    before { allow(airport).to receive_message_chain(:weather, stormy?: false) }

    it 'lands the plane' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end
    context "when initialized with no capacity" do
      it 'raises an error when the default capacity has been reached' do
        described_class::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error "The airport is full"
      end
    end
    context "when initialized with capacity" do
      it 'raises an error when the given capacity has been reached' do
        airport = Airport.new(50)
        allow(airport).to receive_message_chain(:weather, stormy?: false)
        50.times { airport.land(plane) }
        expect{ airport.land(plane) }.to raise_error "The airport is full"
      end
    end
    context 'when weather conditions do not permit landing' do
      it 'raises an error if the weather is stormy' do
        allow(airport).to receive_message_chain(:weather, stormy?: true )
        expect{ airport.land(plane) }.to raise_error "Stormy weather. Landing not permitted."
      end
    end
  end

  describe '#planes' do
    it { is_expected.to respond_to(:planes) }
    it 'returns the landed planes' do
      allow(airport).to receive_message_chain(:weather, stormy?: false)
      airport.land(plane)
      expect(airport.planes).to include plane
    end
  end

  describe '#take_off' do
    before { allow(airport).to receive_message_chain(:weather, stormy?: false) }
    it 'instruct a plane at the airport to take_off' do
      airport.planes << plane
      expect(airport.take_off(plane)).to eq plane
    end
    context 'when plane not at airport' do
      it 'raises an error if there is no such plane at the airport' do
        expect{ airport.take_off(plane) }.to raise_error "The plane can't be found at the airport"
      end
    end
    context 'when weather conditions do not permit flying' do
      it 'raises an error if the weather is stormy' do
        airport.planes << plane
        allow(airport).to receive_message_chain(:weather, stormy?: true )
        expect { airport.take_off(plane) }.to raise_error "Stormy weather. No planes flying."
      end
    end
  end
end
