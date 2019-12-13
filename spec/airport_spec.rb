require 'Airport'

describe Airport do
    # it 'responds to land' do
    #   expect(subject).to respond_to(:land)
    # end
    #
    # it 'responds to take off' do
    #   expect(subject).to respond_to(:takeoff)
    # end
    #
    # it 'creates a new instance of plane when plane lands at the airport' do
    #   plane = subject.land
    #   expect(plane).to be_an_instance_of(Plane)
    # end
    #
    # it 'is expected to respond to take off with 1 arguement' do
    #   expect(subject).to respond_to(:takeoff).with(1).argument
    # end
    #
    # it 'is expected to respond to take off and read plane' do
    #   plane = Plane.new
    #   subject.takeoff(plane)
    #   expect(subject.plane).to eq plane
    # end

    # it 'makes sure that the plane that lands is the one that takes off' do
    #   airport = Airport.new
    #   plane = Plane.new
    #   airport.takeoff(plane)
    #   expect(airport.land).to eq plane

    it 'makes sure that after a plane has landed and taken off, an error is raised to
    say no planes available'do
      airport = Airport.new
      plane = Plane.new
      airport.takeoff(plane)
      airport.land
      expect{ airport.takeoff(plane) }.to raise_error "The plane is no longer at the airport"
    end
    end
