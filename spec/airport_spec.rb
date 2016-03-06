require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  it { expect(airport).to respond_to :planes }

  describe 'landing planes' do

    it 'should add planes after landing' do
      allow(plane).to receive(:landed?).and_return(false)
      allow(plane).to receive(:land).and_return(true)
      airport.accept(plane)
      expect(airport.planes).to include plane
    end

    it 'should not accept landed planes' do
      allow(plane).to receive(:landed?).and_return(true)
      expect{ airport.accept(plane) }.to raise_error "This plane is not currently flying."
    end

  end

end
