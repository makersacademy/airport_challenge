require './lib/airport'
require './lib/weather'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane) }

  #error messages
  not_flying_error = "This plane is not currently flying."
  not_at_airport_error = "This plane is not at this airport."
  weather_error = "This plane cannot depart due to adverse weather conditions"
  capacity_error = "This airport is currently at capcity."

  context 'when weather is not stormy' do
    let(:weather) { double(:weather) }
    before(:each) do
      allow(airport).to receive(:is_stormy?) { false }
      allow(plane).to receive(:land)
    end

    describe 'landing planes' do

      it 'should add planes after landing' do
        allow(plane).to receive(:landed?).and_return(false)
        airport.accept(plane)
        expect(airport.planes).to include plane
      end

      it 'should not accept landed planes' do
        allow(plane).to receive(:landed?).and_return(true)
        expect{ airport.accept(plane) }.to raise_error not_flying_error
      end

      it 'should not land at full airports' do
        allow(plane).to receive(:landed?).and_return(false)
        20.times { airport.accept(plane) }
        expect{ airport.accept(plane) }.to raise_error capacity_error
      end

    end

    describe 'departing planes' do

      it 'should raise error if departing plane is not at airport' do
        allow(airport).to receive(:is_stormy?).and_return(false)
        expect{ airport.depart(plane) }.to raise_error not_at_airport_error
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
        expect{ airport.depart(plane) }.to raise_error weather_error
      end

    end

  end

  describe 'verification' do
    it 'should return whether plane is at airport' do
      expect(airport.present?(plane)).to eq(false)
    end

    it 'should allow users to set airport capacity' do
      allow(airport).to receive(:is_stormy?).and_return(false)
      allow(plane).to receive(:landed?).and_return(false)
      allow(plane).to receive(:land)
      airport.set_capacity=(40)
      40.times { airport.accept(plane) }
      expect{ airport.accept(plane) }.to raise_error capacity_error
    end
  end

end
