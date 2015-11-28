require 'plane'
require 'airport'
require 'air_traffic_control'

describe AirTrafficControl do

let(:plane) {double(:plane)}

  context '<> Landing <>' do
    it 'should land a plane into an airport' do
      airport = Airport.new
      subject.instruct_landing(plane, airport)
      expect(airport.planes.last).to eq plane
    end

    it 'should confirm landing has happened' do
      airport = Airport.new
      expect(subject.instruct_landing(plane, airport)).to eq "Plane #{plane.object_id} landed at #{airport}!"
    end
  end

  context '<> Take off <>' do
    it 'should instruct take off and make plane leave the airport' do
      airport = Airport.new
      subject.instruct_takeoff(plane, airport)
      expect(airport.planes).to be_empty
    end

    it 'should prevent take off if the weather is stormy' do
      airport = double(:airport)
      allow(airport).to receive(:weather_is_stormy?).and_return true  
      expect{subject.instruct_takeoff(plane, airport)}.to raise_error "The weather is too bad to take off!"
    end

    it 'should confirm plane is no longer at the airport' do
      airport = Airport.new
      expect(subject.instruct_takeoff(plane, airport)).to eq "Plane #{plane.object_id} just left #{airport}!"
    end
  end




end
