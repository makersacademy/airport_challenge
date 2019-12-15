require 'airport'

describe Airport do
  describe "#land" do
    it 'lands something' do
      plane = Plane.new
      expect(subject.land(plane)).to be_a Array
    end

    it 'allows a plane to land' do
        plane = Plane.new
         subject.land(plane)
         expect(subject.airport).to include plane
     end

    it 'raises an error when full' do 
      subject.capacity.times{subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error "Error airport full."
    end 
   end

    it {is_expected.to respond_to('take_off')}

    describe "#take_off" do
        it "allows planes to take off" do
        plane = Plane.new
        subject.land(plane)
        subject.take_off(plane)
        expect(subject.airport).to eq []
        end
    end

    it "allows capacity to be set" do
        airport = Airport.new(50)
        expect(airport.capacity).to eq 50
    end

end