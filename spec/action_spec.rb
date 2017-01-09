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

    # it 'throws error when airport full' do
    #   plane = Plane.new
    #   airport = Airport.new
    #   airport.capacity= 1
    #   airport.weather= 'sunny'
    #   subject.land(plane, airport)
    #   expect{subject.land(Plane.new, airport)}.to raise_error("Airport is full")
    # end
    #
    # it 'doesnt throw error when airport is not full' do
    #   plane = Plane.new
    #   airport = Airport.new
    #   airport.weather= 'sunny'
    #   expect{subject.land(Plane.new, airport)}.not_to raise_error
    # end

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
      Action.new.land(plane, airport)
      airport.weather= 'sunny'
      expect{subject.takeoff(plane, airport)}.not_to raise_error
    end
    it 'can land multiple planes' do
      planes = [Plane.new, Plane.new]
      airport = Airport.new
      airport.weather= 'sunny'
      expect{subject.land_multiple(planes, airport)}.not_to raise_error
    end
    it 'can takeoff multiple planes' do
      plane_1 = Plane.new
      plane_2 = Plane.new
      planes = [plane_1, plane_2]
      airport = Airport.new([],2)
      airport.weather= 'sunny'
      subject.land(plane_1, airport)
      subject.land(plane_2, airport)
      expect{subject.takeoff_multiple(planes, airport)}.not_to raise_error
    end
    it 'can\'t land a plane if already landed' do
      plane = Plane.new
      airport = Airport.new
      subject.land(plane, airport)
      expect{subject.land(plane, airport)}.to raise_error("Plane already at an airport")
    end
    it 'can\'t takeoff a plane if it\'s not at the airport' do
      plane = Plane.new
      airport = Airport.new
      expect{subject.takeoff(plane, airport)}.to raise_error("Plane not at airport")
    end
end
end
