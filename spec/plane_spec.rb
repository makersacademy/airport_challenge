require 'plane'

describe Plane do
  describe '#landed?' do
    context 'when plane has not landed at an airport' do
      it 'returns false' do
        plane = Plane.new
        expect(plane.landed?).to eq(false)
      end
    end

    context 'when plane has landed at an airport' do
      it 'returns true' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather)
        plane = Plane.new
        airport.land(plane)
        expect(plane.landed?).to eq(true)
      end
    end

    context 'when plane has landed at and airport then launched' do
      it 'returns false' do
        weather = double('weather', :now => 'sunny')
        airport = Airport.new(weather: weather)
        plane = Plane.new
        airport.land(plane)
        airport.launch(plane)
        expect(plane.landed?).to eq(false)
      end
    end
  end
end
