require 'airport.rb'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

  before do
  allow_any_instance_of(Weather).to receive(:stormy?).and_return(false)
  end

  describe 'landing planes' do
      it 'has the plane after it has landed' do
        allow(plane).to receive(:land)
        airport.land(plane)
        expect(airport.planes).to include plane
      end
    end

  describe 'planes taking off' do
    it 'instructs the plane to take off' do
      expect(plane).to receive(:take_off)
      airport.take_off plane
    end

    it 'it no longer has the plane after it has taken off' do
      allow(plane).to receive(:take_off)
      airport.take_off plane
      expect(airport.planes).not_to include plane
    end
  end

  describe 'weather conditions' do
    it 'does not allow planes to land if weather is stormy' do
    allow_any_instance_of(Weather).to receive(:stormy?).and_return(true)
    expect{airport.land(plane)}.to raise_error ("This plane cannot land due to stormy weather")
  end
end
end
