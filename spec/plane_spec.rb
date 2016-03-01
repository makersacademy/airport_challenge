require 'plane'

describe Plane do
  subject(:plane) {described_class.new}

  context 'Plane is on the ground' do
    before do
      plane.touch_down
    end

    describe '#touch_down' do
      it 'should say the plane has landed' do
        expect(plane.flying).to be(false)
      end
    end

    describe '#in_airport' do
      it 'should say the plane is in the airport' do
         expect(plane.in_airport).to be(true)
      end
    end
  end

  context 'Plane is flying' do
    describe '#cleared' do
      before do
        plane.cleared
      end
      it 'makes the plane take off' do
        expect(plane.flying).to be(true)
      end

      it 'makes the plane fly away' do
        expect(plane.in_airport).to be(false)
      end
    end
  end
end
