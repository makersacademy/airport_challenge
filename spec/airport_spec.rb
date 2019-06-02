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
          allow(Weather.new).to receive("stormy")
          expect(subject.land(plane)).to eq false
      end
      it 'if weather is stormy, planes can not land' do
          allow(Weather.new).to receive("sunny")
          expect(subject.land(plane)).to eq true
      end
  end

  context 'plane is in the aiport' do
    plane = Plane.new
      it 'plane takes off' do
        expect(subject.take_off(plane)).to eq true
      end
     it 'if weather is stormy, planes can not take off' do
        allow(Weather.new).to receive("stormy")
        expect(subject.take_off(plane)).to eq false
     end
     it 'if weather is stormy, planes can not take off' do
        allow(Weather.new).to receive("sunny")
          expect(subject.take_off(plane)).to eq true
     end
   end

  it 'if the airport is full, planes can not land' do
    plane = Plane.new
    allow(subject).to receive(:full?) { true }
    expect(subject.land(plane)).to eq false
  end
  it 'if the airport is full, planes can not land' do
    plane = Plane.new
    allow(subject).to receive(:full?) { false }
    expect(subject.land(plane)).to eq true
  end

  end
