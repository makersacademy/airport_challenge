require 'airport'
describe 'Airport' do

  describe '#initialize' do
    context 'when initialized' do
      it 'has an empty airplanes array' do
        expect(Airport.new.airplanes).to eq []
      end
    end
  end

  describe '.accept_plane' do
    context 'when called' do
      it 'adds plane to array' do
        heathrow = Airport.new
        plane = Airplane.new
        heathrow.accept_plane(plane)
        expect(heathrow.airplanes).to eq [plane]
      end
    end
  end

  describe '.release_plane' do
    context 'when called' do
      it 'removes plane from array' do
        heathrow = Airport.new
        plane = Airplane.new
        plane.land(heathrow)
        heathrow.release_plane(plane)
        expect(heathrow.airplanes).to eq []
      end
    end
  end

end
