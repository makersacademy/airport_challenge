require 'airport.rb'
require 'plane.rb'
require 'weather.rb'

describe Airport do

  describe "#land" do
    it 'should land a plane at an airport' do
      expect { subject.land(plane, weather).to_not raise_error }
    end

    it 'a plane does not land if weather is stormy' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      weather.report_storm
      expect(subject.land(plane, weather)).to eq "Weather is stormy"
    end

    it 'raises an error when airport is full' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      subject.capacity.times {subject.land(plane, weather)}
      expect { subject.land(plane, weather) }.to raise_error "Airport is full"
   end
  end

  describe "#takeoff" do
    it 'instructs a plane to take off and confirms plane is no longer there' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      subject.land(plane, weather)
      subject.takeoff(plane, weather)
      expect(subject.landed_planes).to be_empty
    end

    it 'a plane does not take off if weather is stormy' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      weather.report_storm
      expect(subject.takeoff(plane, weather)).to eq "Weather is stormy"
    end

    it 'raises an error when there are no planes' do
      airport = Airport.new
      plane = Plane.new
      weather = Weather.new
      expect { subject.takeoff(plane, weather) }.to raise_error "No planes available"
    end
  end
end
