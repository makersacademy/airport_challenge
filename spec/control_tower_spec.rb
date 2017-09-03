require 'control_tower'
require 'plane'
require 'weather_report'

describe CONTROL_TOWER do

    it 'take off and confirm plane is no longer on the runway' do
    plane=PLANE.new
    subject.storm?
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.planes).to eq []
  end

   it 'check the weather from control tower' do
   subject.storm?
   expect(subject.weather).to eq 'stormy'

 end

    it 'land plane and check plane is on the runway' do
    plane=PLANE.new

    expect(subject.land(plane)).to eq [plane]
  end

    it 'prevent landing when weather is stormy' do
    plane=PLANE.new
    subject.storm?
    expect(subject.land(plane)).to eq 'NO'
  end

    it 'prevent take off when weather is stormy' do
    plane=PLANE.new
    subject.storm?
    expect(subject.take_off(plane)).to eq 'NO'
  end

    it 'prevent landing if airport is full' do
    plane = PLANE.new
    plane2 = PLANE.new
    DEFAULT_CAPACITY = 1
    subject.land(plane)
    expect(subject.land(plane2)).to eq 'AT CAPACITY'
  end

     it 'set airport capacity' do
     expect(subject.capacity).to eq CONTROL_TOWER::DEFAULT_CAPACITY
   end

     context 'forced good weather to allow take off of landed plane'
     it 'check plane airborne before allowing take off' do

     plane=PLANE.new
     expect(subject.take_off(plane)).to eq 'NO'
   end

      context 'forced good weather to allow landing of airborne plane'
      it 'check if plane is airborne before allowing it to land' do

      plane=PLANE.new

      expect(subject.land(plane)).to eq [plane]
    end

      it 'full' do
      plane=PLANE.new
      # weather.stormy?
      CONTROL_TOWER::DEFAULT_CAPACITY.times{subject.land(plane)}
      expect(subject.full?).to eq true
    end

      it 'check if plane is already on runway' do
        plane=PLANE.new

        subject.land(plane)
        expect(subject.land(plane)).to eq 'NO'
      end
end
