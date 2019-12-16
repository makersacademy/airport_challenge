require 'airport'

describe Airport do
    # it {is_expected.to respond_to('land')}

  describe "#land" do
    it 'lands something' do
      plane = Plane.new
      airport = Airport.new
      expect(airport.land(plane)).to be_a Array
  end

    it 'allows a plane to land' do
        plane = Plane.new
        airport = Airport.new
         airport.land(plane)
         expect(airport.airport).to include plane
     end

    it 'raises an error when full' do 
        airport = Airport.new
      airport.capacity.times{airport.land(Plane.new)}
      expect{airport.land(Plane.new)}.to raise_error "Error airport full."
    end 
   end

    # it {is_expected.to respond_to('take_off')}

    describe "#take_off" do
        it "allows planes to take off" do
        plane = Plane.new
        airport = Airport.new
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.airport).to eq []
        end

        it "doesnt allow a plane to take off if its stormy" do
            plane = Plane.new
            airport = Airport.new
            # p "hello"
            # p airport
            airport.land(plane)
            expect(airport.take_off(plane)).to raise_error "Error weather too stormy"
        end
    end

    it "allows capacity to be set" do
        airport = Airport.new(50)
        expect(airport.capacity).to eq 50
    end

end