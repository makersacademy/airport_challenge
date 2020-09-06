require 'plane'

class AirportDouble
end

describe Plane do

  subject(:plane) { Plane.new }
  let(:airport) { AirportDouble.new }

  describe '#new' do
    it 'creates a plane with the status set to landed' do
      expect(plane.status).to eq(:landed)
    end
  end

  describe '#land' do
    it { should respond_to(:land).with(0).arguments }

    context 'when plane is airborne' do
      before do
        plane.takeoff
      end

      it 'changes plane status to landed' do
        expect { plane.land }.to change { plane.status }.from(:airborne).to(:landed)
      end

      it 'returns :landed' do
        expect(plane.land).to eq(:landed)
      end
    end

    context 'when plane is already landed' do
      it 'raises error and plane status remains landed' do
        expect { plane.land }.to raise_error('Plane is already on the ground')
        expect(plane.status).to eq(:landed)
      end
    end
  end

  describe '#takeoff' do
    context 'when plane is landed' do
      it 'changes plane status to airborne' do
        expect { plane.takeoff }.to change { plane.status }.from(:landed).to(:airborne)
      end

      it 'returns :airborne' do
        expect(plane.takeoff).to eq(:airborne)
      end
    end

    context 'when plane is already airborne' do
      before do
        plane.takeoff
      end

      it 'raises error and plane status remains airborne' do
        expect { plane.takeoff }.to raise_error('Plane is already airborne')
        expect(plane.status).to eq(:airborne)
      end
    end
  end
end
