require 'airport'

describe Airport do
  describe "#land" do
    it 'lands something' do
      plane = Plane.new
      expect(subject.land(plane)).to be_a Array
    end

    it 'raises an error when full' do 
      subject.capacity.times{subject.land(Plane.new)}
      expect{subject.land(Plane.new)}.to raise_error "Error airport full."
    end 

    # describe "#take_off" do
    #     p (Airport.new).weather(stormy)
    #     storm = subject.weather(stormy)
    #     expect{storm.take_off}.to raise_error "Stormy weather, cant take off"
    # end
   end

   describe "#land" do
       it 'allows a plane to land' do
          plane = Plane.new
           subject.land(plane)
           expect(subject.airport).to include plane
       end
   end

  
    # describe "#take_off" do
    #     it "allows a plane to take off" do
    #         expect(subject.take_off).to 
    #     end  
    # end

    it {is_expected.to respond_to('take_off')}

end