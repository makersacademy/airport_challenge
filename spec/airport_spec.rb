require './lib/airport.rb'
require './lib/plane.rb'

describe Airport do
  context 'plane is in the air' do
      plane = Plane.new
      it 'lands plane' do
        expect(subject.land(plane)).to eq true
      end
  end
  context 'plane is in the aiport' do
    plane = Plane.new
      it 'plane takes off' do
        expect(subject.take_off(plane)).to eq true
      end
  end
end
