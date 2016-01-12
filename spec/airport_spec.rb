require 'airport'

describe Airport do

  subject(:airport) {described_class.new(weather: weather)}
  let(:plane) {double(:plane)}
  let(:weather) {double(:weather, bad?: false)}

  context '-- When bad weather' do
    before do
      allow(weather).to receive(:bad?) { true }
    end

    describe '#approve_landing?' do
      it 'should prevent landing if the weather at airport is bad' do
        expect{airport.approve_landing?(plane)}.to raise_error "Bad weather, try again later"
      end
    end

    describe '#approve_takeoff?' do
      it 'should prevent take off if the weather is bad' do
        airport.planes << plane
        expect{airport.approve_takeoff?(plane)}.to raise_error "Bad weather, try again later"
      end
    end
  end

  context '-- When good weather' do
    describe '#approve_landing?' do
      it 'should add the landed plane' do
        airport.approve_landing?(plane)
        expect(airport.planes.include?(plane)).to eq true
      end
      it 'should prevent landing if the airport is full' do
        airport.max_capacity.times { airport.approve_landing?(plane) }
        expect{airport.approve_landing?(plane)}.to raise_error "#{airport.name} is full"
      end
    end

    describe '#approve_takeoff?' do
      it 'should remove the plane from the airport after take off' do
        airport.approve_landing?(plane)
        airport.approve_takeoff?(plane)
        expect(airport.planes.include?(airport)).to eq false
      end
    end
  end

end
