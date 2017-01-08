require 'action.rb'
require 'plane.rb'
require 'airport.rb'

context "TESTING ACTION" do
  describe Action do
    it 'can land a plane at an airport from both perspectives' do
      plane = Plane.new
      airport = Airport.new
      airport.weather= 'sunny'
      subject.land(plane, airport)
      did_land = (plane.current_airport == airport && airport.planes.include?(plane))
      expect(did_land).to eq true
    end

    it 'throws error when stormy' do
      plane = Plane.new
      airport = Airport.new
      airport.weather= 'stormy'
      expect{subject.land(plane, airport)}.to raise_error("Weather is too stormy")
    end

    it 'doesnt throw error when sunny' do
      plane = Plane.new
      airport = Airport.new
      airport.weather= 'sunny'
      expect{subject.land(plane, airport)}.not_to raise_error
    end

    it 'throws error when airport full' do
      plane = Plane.new
      airport = Airport.new
      airport.land(plane)
      expect{subject.land(Plane.new, airport)}.to raise_error("Airport is full")
    end
    it 'doesnt throw error when airport is not full' do
      plane = Plane.new
      airport = Airport.new
      expect{subject.land(Plane.new, airport)}.not_to raise_error
    end
    it 'can takeoff a plane at an airport from both perspectives' do
      plane = Plane.new
      airport = Airport.new
      airport.weather= 'sunny'
      subject.land(plane, airport)
      subject.takeoff(plane, airport)
      did_takeoff = (plane.current_airport != airport && !airport.planes.include?(plane))
      expect(did_takeoff).to eq true
    end

    it 'throws error when stormy' do
      plane = Plane.new
      airport = Airport.new
      airport.weather= 'stormy'
      expect{subject.takeoff(plane, airport)}.to raise_error("Weather is too stormy")
    end

    it 'doesnt throw error when sunny' do
      plane = Plane.new
      airport = Airport.new
      airport.weather= 'sunny'
      expect{subject.takeoff(plane, airport)}.not_to raise_error
    end

  end


end
