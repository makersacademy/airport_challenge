require 'airplane'
describe Airplane do

  describe '.land' do
    context 'when called' do
      it { is_expected.to respond_to(:land) }
    end
    context 'when called with argument' do
      it { is_expected.to respond_to(:land).with(1).argument }
    end
    context 'when called without argument' do
      it 'throws an error' do
        expect{Airplane.new.land}.to raise_error 'No airport specified'
      end
    end
    context 'when called whilst .landed? is true' do
      it 'throws an error' do
        heathrow = Airport.new
        (airplane = Airplane.new).land(heathrow)
        expect{airplane.land(heathrow)}.to raise_error 'Plane is already landed'
      end
    end
    context 'when called with an airport' do
      it 'will land the plane in the airport' do
        heathrow = Airport.new
        plane = Airplane.new
        plane.land(heathrow)
        expect(heathrow.airplanes).to eq [plane]
        expect(plane.landed?).to eq true
      end
    end

  end

  describe '.takeoff' do
    context 'when called with an airport' do
      it 'will takeoff from the airport' do
        heathrow = Airport.new
        plane = Airplane.new
        plane.land(heathrow)
        plane.takeoff(heathrow)
        expect(heathrow.airplanes).to eq []
        expect(plane.landed?).not_to eq true
      end
    end
    context 'when called without argument' do
      it 'throws an error' do
        expect{Airplane.new.takeoff}.to raise_error 'No airport specified'
      end
    end
    context 'when called whilst .landed? is false' do
      it 'throws an error' do
        heathrow = Airport.new
        (airplane = Airplane.new).land(heathrow)
        airplane.takeoff(heathrow)
        expect{airplane.takeoff(heathrow)}.to raise_error 'Plane is already flying'
      end
    end
    context 'when called with an incorrect airport' do
      it 'throws an error' do
        heathrow = Airport.new
        gatwick = Airport.new
        (airplane = Airplane.new).land(heathrow)
        expect{airplane.takeoff(gatwick)}.to raise_error 'Plane is not in specified airport'
      end
    end
  end
end
