require 'plane'

describe Plane do

  let(:airport){ double :airport }
  let(:airport2){ double :airport2 }

	context 'when created' do 
		it 'is flying' do 
			expect(subject.flying?).to eq true
		end

    it 'has a destination' do 
      expect(subject.destination).to be_truthy
    end

    it "has a default destination of 'nowhere!'" do
      expect(subject.destination).to eq("nowhere!")
    end

    it 'has no location' do 
      expect(subject.location).to be_nil
    end

    it 'has a pilot' do 
      expect(subject.pilot).to be_truthy
    end

    it 'its pilot does not have permission to land anywhere' do 
      expect(subject.pilot.permission_to_land).to be false
    end
	end

  context 'when created specifying an airport as a destination' do
    it 'has a destination that is that airport' do 
      plane = Plane.new(airport)
      plane.destination == airport
    end
  end

  it 'can land' do 
  	expect(subject).to respond_to :land
  end

  it 'cannot land if pilot does not have permission' do 
    airport = Airport.new
    plane = Plane.new(airport)
    expect{plane.land(airport)}.to raise_error "Pilot does not have permission to land this plane"
  end

  context 'when landing' do 
    it "traffic controller is notified of final approach and is stopped if airport has since become full" do 
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      first_plane = Plane.new(airport) 
      first_plane.pilot.request_to_land(airport)

      5.times do 
        extra_plane = Plane.new(airport)
        extra_plane.pilot.request_to_land(airport)
        extra_plane.pilot.land_plane(airport)
      end

      expect{first_plane.land(airport)}.to raise_error "Airport is now full! Permission to land revoked!"
      expect(first_plane.pilot.permission_to_land).to be false

    end

    xit "traffic controller is notified of final approach and is stopped if weather has changed to stormy"

  end

  context 'after it lands' do

    it 'is landed' do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport)
      plane.land(airport)
      expect(plane).to be_landed
    end

    it 'no longer has a destination' do 
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport)
      plane.land(airport)
      expect(plane.destination).to be_nil
    end

    it "its 'location' matches the airport it has landed at" do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport) 
      plane.land(airport)

      expect(plane.location).to eq airport
    end

    it 'cannot be landed and flying at the same time' do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport) 
      plane.land(airport) 

      expect(plane).to_not be_flying
    end

    it 'cannot take off if its pilot does not have permission to take off, even though its destination is to a different airport' do 
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      airport2 = Airport.new
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport) 
      plane.land(airport)

      expect{plane.take_off(airport2)}.to raise_error "This plane's pilot does not have permission to take off"
    end

    it 'can take off if its pilot has permission and its destination is to a different airport' do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      airport2 = Airport.new
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport) 
      plane.land(airport)

      plane.pilot.request_to_take_off(airport2)
      plane.pilot.take_off(airport2)
      expect(plane).to be_flying
    end

    it 'cannot take off for the same destination that it is currently located in' do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport) 
      plane.land(airport)
      plane.pilot.request_to_take_off(airport)

      expect{plane.take_off(airport)}.to raise_error "This plane is currently located at the destination you have specified - enter a different destination"     
    end
  end

  it 'cannot be flying and landed at the same time' do 
  	expect(subject).to_not be_landed
  end

  context 'after it has taken off' do 
    it 'is flying' do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      airport2 = Airport.new
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport) 
      plane.land(airport)
      plane.pilot.request_to_take_off(airport2)
      plane.take_off(airport2)
      expect(plane).to be_flying
    end

    it 'has a new destination' do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport) 
      plane.land(airport)
      plane.pilot.request_to_take_off(airport2)
      plane.take_off(airport2)
      expect(plane.destination).to be(airport2)
    end

    it 'has no location' do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport) 
      plane.land(airport)
      plane.pilot.request_to_take_off(airport2)
      plane.take_off(airport2)
      expect(plane.location).to be_nil      
    end
  end


  describe '#land' do 
    it 'raises an error if no argument is given' do
      airport = Airport.new
      expect{subject.land}.to raise_error(ArgumentError)
    end

    it 'does not raise an error if an argument is given' do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport)
      expect{plane.land(airport)}.to_not raise_error
    end

    it 'returns the plane when called on a plane' do
      airport = Airport.new
      airport.stub(:weather).and_return("Glorious sunshine")
      plane = Plane.new(airport)
      plane.pilot.request_to_land(airport) 
      expect(plane.land(airport)).to eq plane
    end
  end

end
