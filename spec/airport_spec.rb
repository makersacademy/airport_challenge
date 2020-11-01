require 'airport'

describe Airport do

  context '#landing method' do
    it 'is able to land a plane' do
      expect(subject).to respond_to(:landing).with(1).argument
    end

    it 'pushes the planes in to hangar' do
      plane = Plane.new
      subject.landing(plane)
      expect(subject.hangar).to eq [plane]
    end

    it 'wont allow more planes than the capacity allows for' do
      plane = Plane.new
      airport = Airport.new(0)
      expect{ airport.landing(plane) }.to raise_error "NO SPACE"

    end
  end

  context '#take_off method' do
    it 'is able to let a plane take off' do
      expect(subject).to respond_to(:take_off)
    end

    it 'removes the plane from the hangar when it takes off' do
      plane = Plane.new
      subject.landing(plane)
      expect(subject.take_off(plane)).to eq(plane)
      expect(subject.hangar).to be_empty
    end
  end
end


#As an air traffic controller
#So I can get passengers to a destination --- LANDING
#I want to instruct a plane to land at an airport

#I need to be able to land a plane if there is space at the airport and the weather permits

#As an air traffic controller
#So I can get passengers on the way to their destination --- TAKE OFF
#I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

#I need to be able to make a plane take off if there are planes at the airport and the weather permits

#As an air traffic controller
#To ensure safety --- FULL AIRPORT
#I want to prevent landing when the airport is full

#I want to be able to stop planes from landing when it is full

#As the system designer
#So that the software can be used for many different airports --- SET DEFAULT CAPACITY
#I would like a default airport capacity that can be overridden as appropriate

#I want to be able to set a different number for the capacity for different airports

#As an air traffic controller
#To ensure safety  ---  PREVENT TAKE OFF
#I want to prevent takeoff when weather is stormy

#I want to be able to sto

#As an air traffic controller
#To ensure safety  ---   PREVENT LANDIN
#I want to prevent landing when weather is stormy
