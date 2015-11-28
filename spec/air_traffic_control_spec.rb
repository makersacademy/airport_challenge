require 'air_traffic_control'

describe AirTrafficControl do

  let(:plane) {double(:plane,
                :is_flying= => true,
                :is_flying => true)}
  let(:airport) {double(:airport,
                :name => "JFK",
                :weather_is_stormy? => false,
                :planes => [],
                :full? => false)}

  context '<> Landing <>' do
    it 'should land a plane into an airport' do
      subject.instruct_landing(plane, airport)
      expect(airport.planes.last).to eq plane
    end

    it 'should prevent landing if the weather is stormy' do
      allow(airport).to receive_messages(:weather_is_stormy? => true)
      expect{subject.instruct_landing(plane, airport)}.to raise_error "The weather is too bad to land at #{airport.name}!"
    end

    it 'should prevent landing if the airport is full' do
      allow(airport).to receive_messages(:full? => true)
      expect{subject.instruct_landing(plane, airport)}.to raise_error "Can't land at #{airport.name}, it is full!"
    end

    it 'should prevent landing if the plane is already landed' do
      allow(plane).to receive_messages(:is_flying => false)
      expect{subject.instruct_landing(plane, airport)}.to raise_error "This plane is already landed!"
    end

    it 'should confirm landing has happened' do
      expect(subject.instruct_landing(plane, airport)).to eq "Plane #{plane.object_id} landed at #{airport.name}!"
    end
  end

  context '<> Take off <>' do
    it 'should instruct take off and make plane leave the airport' do
      subject.instruct_landing(plane, airport)
      subject.instruct_takeoff(plane, airport)
      expect(airport.planes).to be_empty
    end

    it 'should prevent take off if the weather is stormy' do
      subject.instruct_landing(plane, airport)
      allow(airport).to receive_messages(:weather_is_stormy? => true)
      expect{subject.instruct_takeoff(plane, airport)}.to raise_error "The weather is too bad to take off from #{airport.name}!"
    end

    it 'should prevent take off if plane is not at the airport' do
      plane2 = double(:plane)
      expect{subject.instruct_takeoff(plane2, airport)}.to raise_error "This plane is not at #{airport.name}!"
    end

    it 'should confirm plane is no longer at the airport' do
      subject.instruct_landing(plane, airport)
      expect(subject.instruct_takeoff(plane, airport)).to eq "Plane #{plane.object_id} just left #{airport.name}!"
    end
  end

end
