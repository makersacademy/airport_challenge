require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do
before(:each) do
  @plane = Plane.new
  subject.weather = :Sunny
end

 context "landing a plane" do
   it "should check arg given is a plane object" do
     allow(subject).to receive(:land) {@plane}
     expect(subject.land(@plane)).to be_a Plane
   end

   it "should raise error if arg is not a plane" do
     plane = "I'm not a plane"
     message = "Only planes can be landed"
     expect{subject.land(plane)}.to raise_error(message)
   end

   it "should raise error if plane has already been landed" do
     message = "Plane has already landed"
     expect{subject.land(@plane)}.to raise_error(message)
   end

   it "should change landed status to true if it was false" do
     @plane.landed_status = false
     expect{subject.land(@plane)}.to change {@plane.landed_status}.from(false).to(true)
   end

   it "should return message that plane has landed" do
     @plane.landed_status = false
     expect(subject.land(@plane)).to eq "#{@plane} has landed"
   end
 end

 context "allow planes to take off" do
   it "should raise error if plane is still in the air" do
     @plane.landed_status = false
     message = "Plane is still in the air"
     expect{ subject.take_off(@plane) }.to raise_error(message)
   end

   it "taking off should change plane's landed_status to false" do
     expect{subject.take_off(@plane)}.to change{@plane.landed_status}.from(true).to(false)
   end

   it "should return message to let air controller know that plane has taken off" do
     message = "#{@plane} has taken off"
     expect(subject.take_off(@plane)).to eq message
   end
 end

  context "prevent take off when weather is stormy" do
    it "should raise error if it is stormy" do
      subject.weather = :Stormy
      message = "Unable to take off because of the stormy weather"
      expect{subject.take_off(@plane)}.to raise_error(message)
    end
  end

  context "prevent landing when weather is stormy" do
    it "should return message that prevents landing in stormy weather" do
      subject.take_off(@plane)
      subject.weather = :Stormy
      message = "Unable to land because of the stormy weather"
      expect{subject.land(@plane)}.to raise_error(message)
    end
  end

  context "prevent landing when airport is full" do
    it "should check for capacity of airport" do
      expect(subject.capacity).to eq 1
    end

    it "should check for planes array" do
      expect(subject.planes).to eq subject.planes
    end

    it "should add instance of a Plane to the Airport's planes array" do
     expect(subject.store(@plane)).to eq subject.planes
    end

    it "should store the plane when it lands" do
      @plane.landed_status = false
      subject.land(@plane)
      expect(subject.planes).to eq [@plane]
    end

    it "should raise error if airport is full when attempting to land" do
      @plane.landed_status = false
      subject.planes = [@plane]
      message = "Airport is full. Plane is unable to land"
      expect{subject.land(@plane)}.to raise_error(message)
    end
  end

  context "remove plane from airport once it has taken off" do
    it "should return array with one less element after take off" do
      subject.planes = [@plane]
      subject.take_off(@plane)
      expect(subject.planes).to eq []
    end
  end

  context "initializing with default capacity" do
    context "with parameter" do
      let(:airport) {Airport.new(2)}
      it "should use specified parameter for capacity" do
        expect(airport.capacity).to eq 2
      end
    end

    context "without parameter" do
      let(:airport) {Airport.new}
      it "should use default if no parameter given" do
        expect(airport.capacity).to eq 1
      end
    end
  end

  context "check weather to change weather" do
    it "should respond to a check weather method" do
      expect(subject).to respond_to(:check_weather)
    end

    it "should return a the Airport's weather instance" do
      expect(subject.check_weather).to eq subject.weather
    end
  end

end
