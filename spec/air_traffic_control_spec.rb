require 'air_traffic_control'

describe AirTrafficControl do

  let(:plane) {double(:plane,:is_flying= => true,is_flying: true)}
  let(:airport) {double(:airport,name: "JFK",bad_weather?: false,planes: [],full?: false)}

  context '<> Landing <>' do
    it 'should land a plane into an airport' do
      subject.land(plane, airport)
      expect(airport.planes.last).to eq plane
    end

    it 'should prevent landing if the weather is stormy' do
      allow(airport).to receive_messages(bad_weather?: true)
      expect{subject.land(plane, airport)}.to raise_error "Bad weather; can't land at #{airport.name}!"
    end

    it 'should prevent landing if the airport is full' do
      allow(airport).to receive_messages(full?: true)
      expect{subject.land(plane, airport)}.to raise_error "#{airport.name} is full!"
    end

    it 'should prevent landing if the plane is already landed' do
      allow(plane).to receive_messages(is_flying: false)
      expect{subject.land(plane, airport)}.to raise_error "This plane is already landed!"
    end

    it 'should confirm landing has happened' do
      expect(subject.land(plane, airport)).to eq "Plane #{plane.object_id} landed at #{airport.name}!"
    end
  end

  context '<> Take off <>' do
    it 'should instruct take off and make plane leave the airport' do
      subject.land(plane, airport)
      subject.take_off(plane, airport)
      expect(airport.planes).to be_empty
    end

    it 'should prevent take off if the weather is stormy' do
      subject.land(plane, airport)
      allow(airport).to receive_messages(bad_weather?: true)
      expect{subject.take_off(plane, airport)}.to raise_error "Bad weather; the plane can't take off!"
    end

    it 'should prevent take off if plane is not at the airport' do
      plane2 = double(:plane)
      expect{subject.take_off(plane2, airport)}.to raise_error "This plane is not at #{airport.name}!"
    end

    it 'should confirm plane is no longer at the airport' do
      subject.land(plane, airport)
      expect(subject.take_off(plane, airport)).to eq "Plane #{plane.object_id} just left #{airport.name}!"
    end
  end

end
