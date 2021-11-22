require 'airport'

describe Airport do

  describe 'Airport.new' do
    it 'Creates an airport' do
      plane = Airport.new("London", 5)
      expect(plane).to be_an_instance_of Airport
    end
  end

  describe '#check_requests' do
    it 'Checks if planes meet requirements for landing at destination airport' do   
      allow_any_instance_of(AirportControl).to receive(:stormy?).and_return(false)
      london = Airport.new("London")
      plane1 = Plane.new("Boeing", "Paris", "London", "Flying")
      plane1.request_landing(plane1)
      expect(london.check_requests).to be_an_instance_of Array
    end 
  end

  describe '#accept_requests' do
      it 'Raises an error if landing requests exceed airport capacity' do
        allow_any_instance_of(AirportControl).to receive(:stormy?).and_return(false)
        london = london = Airport.new("London")
        plane1 = Plane.new("Boeing", "Paris", "London", "Flying")
        plane2 = Plane.new("Boeing", "Paris", "London", "Flying")
        plane3 = Plane.new("Boeing", "Paris", "London", "Flying")
        plane4 = Plane.new("Boeing", "Paris", "London", "Flying")
        plane5 = Plane.new("Boeing", "Paris", "London", "Flying")
        plane6 = Plane.new("Boeing", "Paris", "London", "Flying")
        plane1.request_landing(plane1)
        plane2.request_landing(plane2)
        plane3.request_landing(plane3)
        plane4.request_landing(plane4)
        plane5.request_landing(plane5)
        plane6.request_landing(plane6)
        london.check_requests
        expect { london.accept_requests }.to raise_error("Sorry we have reached maximum capacity")
      end
    end

end
