require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

  context 'plane is in the air' do
      plane = Plane.new
      it 'lands plane' do
        expect(subject.land(plane)).to eq true
      end
      it 'if weather is stormy, planes can not land' do
          if Weather.new == "stormy"
            expect(subject.land(plane)).to eq false
          else
            expect(subject.land(plane)).to eq true
          end
       end
  end

  context 'plane is in the aiport' do
    plane = Plane.new
      it 'plane takes off' do
        expect(subject.take_off(plane)).to eq true
      end
    it 'if weather is stormy, planes can not take off' do
        if Weather.new == "stormy"
          expect(subject.take_off(plane)).to eq false
        else
          expect(subject.take_off(plane)).to eq true
        end
     end
   end
end
