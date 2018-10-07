require 'airport_controller'
require 'plane'
require 'airport'

describe AirportController do

  describe '#instruct_plane_to_land' do
    it 'instructs a plane to land at an airport' do
      airport = double :airport, :add_plane => nil
      plane = double :plane, location: 'airborn', :location= => airport
      expect(subject.instruct_plane_to_land(plane, airport)).to eq true
    end

    it "doesn't instructs a plane to land at an airport, unless the plane is flying" do
      airport = double :airport, :add_plane => nil
      plane = double :plane, location: 'landed'
      expect { subject.instruct_plane_to_land(plane, airport) }.to raise_error 'Plane is already at an airport!'
    end

    it 'after landing, the plane location is updated' do
      airport = double :airport, :add_plane => nil
      plane = double(:plane, :location => 'airborn')
      expect(plane).to receive(:location=)
      subject.instruct_plane_to_land(plane, airport)
    end

    it 'after landing, the plane is added to the airport' do
      plane = double :plane, :location => 'airborn', :location= => nil 
      airport = double :airport, :add_plane => plane
      expect(airport).to receive(:add_plane).with(plane)
      subject.instruct_plane_to_land(plane, airport)
    end
  end

end
