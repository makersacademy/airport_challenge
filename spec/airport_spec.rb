require 'airport.rb'
require 'plane.rb'

describe Airport do

  describe "#land" do
    it 'should land a plane at an airport' do
      expect { subject.land(plane).to_not raise_error }
    end
  end
  describe "#takeoff" do
    it 'instructs a plane to take off and confirms plane is no longer there' do
      airport = Airport.new
      plane = Plane.new
      expect(subject.takeoff(plane)).to eq "Plane has taken off"
    end
  end
end
