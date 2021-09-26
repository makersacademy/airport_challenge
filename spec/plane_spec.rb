require 'plane'

describe Plane do
  let(:airport) { Airport.new }
  subject(:plane) { described_class.new }

  before do
    allow(airport).to receive(:stormy?).and_return(false)
  end
  context '#landing' do
    it 'updates location' do
      airport.land(subject)
      expect(subject.location).to eq airport
    end
  end

  context '#take_off' do
    it 'updates location' do
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.location).to eq 'Sky'
    end
  end
end
