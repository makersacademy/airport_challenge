require 'airport_controller'
require 'plane'
require 'airport'

describe AirportController do
  subject { 
    weather = double :weather, stormy?: false
    AirportController.new(weather) 
  }
  describe '#instruct_plane_to_land' do
  
    it 'instructs a plane to land at an airport' do
      airport = double :airport, :add_plane => nil
      plane = double :plane, location: Plane::AIRBORN, :location= => airport
      expect(subject.instruct_plane_to_land(plane, airport)).to eq true
    end

    it "doesn't instructs a plane to land at an airport, unless the plane is flying" do
      airport = double :airport, :add_plane => nil
      plane = double :plane, location: 'landed'
      expect { subject.instruct_plane_to_land(plane, airport) }.to raise_error Plane::NOT_AIRBORN
    end

    it 'after landing, the plane location is updated' do
      airport = double :airport, :add_plane => nil
      plane = double(:plane, :location => Plane::AIRBORN)
      expect(plane).to receive(:location=)
      subject.instruct_plane_to_land(plane, airport)
    end

    it 'after landing, the plane is added to the airport' do
      plane = double :plane, :location => Plane::AIRBORN, :location= => nil 
      airport = double :airport, :add_plane => plane
      expect(airport).to receive(:add_plane).with(plane)
      subject.instruct_plane_to_land(plane, airport)
    end
  end

  describe ' #instructs_plane_to_take_off' do

    it 'instructs a plane to take off from an airport' do
      airport = double :airport, :plane? => true, :remove_plane => true
      plane = double :plane, location: airport, :location= => Plane::AIRBORN
      expect(subject.instruct_plane_to_take_off(plane, airport)).to eq true
    end

    it "doesn't instruct a plane to take_off from an airport, if it's airborn" do
      airport = double :airport, :plane? => false, :remove_plane => false
      plane = double :plane, location: Plane::AIRBORN
      expect { subject.instruct_plane_to_take_off(plane, airport) }.to raise_error Plane::IS_AIRBORN
    end

    it "doesn't instruct a plane to take_off from an airport, if the plane is in a different airport" do
      airport = double :airport, :plane? => false, :remove_plane => true
      airport2 = double :airport2, :plane? => true, :remove_plane => false
      plane = double :plane, location: airport2
      expect { subject.instruct_plane_to_take_off(plane, airport) }.to raise_error Airport::NOT_IN_THIS_AIRPORT
    end

    it "instructs a plane to take_off from an airport, and remove the plane from airport" do
      airport = double :airport, :plane? => true, :remove_plane => true
      plane = double :plane, location: airport, :location= => airport
      expect(airport).to receive(:remove_plane).with(plane)
      subject.instruct_plane_to_take_off(plane, airport)
    end

    it 'after take off the plane location is updated' do
      airport = double :airport, :plane? => true, :remove_plane => true
      plane = double :plane, location: airport, :location= => airport
      expect(plane).to receive(:location=).with(Plane::AIRBORN)
      subject.instruct_plane_to_take_off(plane, airport)
    end

    context "weather" do
      context "stromy weather" do
        subject { 
          weather = double :weather, stormy?: true
          AirportController.new(weather) 
        }
        it 'should prevent takeoff when weather is stormy' do
          airport = double :airport, :plane? => true, :remove_plane => true
          plane = double :plane, location: airport, :location= => Plane::AIRBORN
          expect { subject.instruct_plane_to_take_off(plane, airport) }.to raise_error AirportController::WEATHER_IS_STORMY
        end
      end
      context "sunny weather" do
        subject { 
          weather = double :weather, stormy?: false
          AirportController.new(weather) 
        }
        it 'should not prevent takeoff when weather is sunny' do
          airport = double :airport, :plane? => true, :remove_plane => true
          plane = double :plane, location: airport, :location= => Plane::AIRBORN
          expect(subject.instruct_plane_to_take_off(plane, airport)).to eq true
        end
      end

    end

  end

end
