require 'plane'

describe Plane do

  let(:plane) {described_class.new}

  describe '#touch_down' do
    context 'when a plane touches_down it' do
      it 'should update status to be landed' do
        plane.touch_down
        expect(plane.landed).to eq true
      end

    it 'should fail if it is already landed' do
        plane.touch_down
        expect{plane.touch_down}.to raise_error "This plane is landed elsewhere"
      end
    end
  end

  describe '#in_flight' do
    context 'when a plane is in flight it' do
      it 'should update status to not be landed' do
        plane.in_flight
        expect(plane.landed).to eq false
      end
    end
  end
end
