require 'airport'

describe Airport do

  describe 'landing' do

      it 'allows to land and confirm landing' do
        plane = Plane.new
        weather = double(:weather, condition: false)
        subject.land(plane, weather)
        expect(plane.confirmation).to eq "landed"
      end

      it 'prevents landing when stormy' do
        plane = Plane.new
        weather = double(:weather, condition: true)
        expect {subject.land(plane, weather)}.to raise_error 'cannot land, too stormy'
      end

      it 'prevents landing when airport is full' do
        plane = Plane.new
        weather = double(:weather, condition: false)
        20.times {subject.land(plane, weather)}
        expect {subject.land(plane, weather)}.to raise_error 'cannot land plane, airport full'
      end
  end

  describe 'take_off' do

      it 'allows to take off and confirm taking off' do
        plane = Plane.new
        weather = double(:weather, condition: false)
        subject.land(plane, weather)
        subject.take_off(plane, weather)
        expect(plane.confirmation).to eq 'flying'
      end

      it 'prevents take off if stormy' do
        plane = Plane.new
        weather = double(:weather, condition: false)
        subject.land(plane, weather)
        weather = double(:weather, condition: true)
        expect {subject.take_off(plane, weather)}.to raise_error 'cannot take off, too stormy'
      end
    end

    describe 'initialization' do

      it 'has a variable capacity' do
        plane = Plane.new
        weather = double(:weather, condition: false)
        airport = Airport.new(30)
        30.times {airport.land(plane, weather)}
        expect {airport.land(plane, weather)}.to raise_error 'cannot land plane, airport full'
      end
    end
end
