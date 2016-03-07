require './lib/airport'
require './lib/weather'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  context 'when weather is not stormy' do
    let(:weather) { double(:weather) }
    before(:each) { allow(airport).to receive(:is_stormy?) { false } }

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

      it 'should raise error if departing plane is not at airport' do
        allow(airport.weather).to receive(:stormy).and_return(false)
        expect{ airport.depart(plane) }.to raise_error "This plane is not at this airport."
      end

      it 'should remove planes after departing' do
        allow(plane).to receive(:landed?).and_return(false)
        allow(plane).to receive(:land)
        airport.accept(plane)
        allow(plane).to receive(:depart)
        airport.depart(plane)
        expect(airport.planes).not_to include plane
      end
    end

  end
  context 'when weather is stormy' do

    describe 'departing planes' do

      it 'should be prevented from taking off' do
        allow(airport).to receive(:is_stormy?).and_return(false)
        allow(plane).to receive(:landed?).and_return(false)
        allow(plane).to receive(:land)
        airport.accept(plane)
        allow(airport).to receive(:is_stormy?).and_return(true)
        allow(plane).to receive(:depart)
        expect{ airport.depart(plane) }.to raise_error "This plane cannot depart due to adverse weather conditions"
      end

    end

  end

  describe 'verification' do
    it 'should return whether plane is at airport' do
      expect(airport.present?(plane)).to eq(false)
    end
  end

end
