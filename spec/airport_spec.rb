require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  it { expect(airport).to respond_to :planes }

  describe 'landing planes' do

    it 'should add planes after landing' do
      allow(plane).to receive(:landed?).and_return(false)
      allow(plane).to receive(:land)
      airport.accept(plane)
      expect(airport.planes).to include plane
    end

    it 'should not accept landed planes' do
      allow(plane).to receive(:landed?).and_return(true)
      expect{ airport.accept(plane) }.to raise_error "This plane is not currently flying."
    end

  end

  describe 'departing planes' do

    it 'should remove planes after departing' do
      allow(plane).to receive(:landed?).and_return(false)
      allow(plane).to receive(:land)
      airport.accept(plane)
      allow(plane).to receive(:depart)
      airport.depart(plane)
      expect(airport.planes).not_to include plane
    end

    it 'should raise error if departing plane is not at airport' do
      expect{ airport.depart(plane) }.to raise_error "This plane is not at this airport."
    end
  end

  describe 'verification' do
    it 'should return whether plane is at airport' do
      expect(airport.present?(plane)).to eq(false)
    end
  end

end
