require_relative "../lib/airport.rb"

describe Airport do 
   
  let(:plane) { double("plane") }
  let(:weather) { double("weather") }
  
  describe "#land" do

    it "a landed plane should be in hanger" do
      allow(weather).to receive(:forecast)
      subject.land(plane, weather)
      expect(subject.hanger).to include(plane)
    end

    it "won't land an already landed plane" do
      allow(weather).to receive(:forecast)
      subject.land(plane, weather)
      expect { subject.land(plane, weather) }.to raise_error("Already Grounded")
    end

    it "it won't let the plane land if weather is stormy" do 
      allow(weather).to receive(:forecast).and_return("stormy")
      expect { subject.land(plane, weather) }.to raise_error("Weather too bad")
    end
    
  end

  describe "#take_off" do

    it "a plane that takes off should be removed from hanger" do
      allow(weather).to receive(:forecast)
      subject.land(plane, weather)
      subject.take_off(plane, weather)
      expect(subject.hanger).to eq []
    end

    it "a plane can only take off, if its in the hanger" do
      allow(weather).to receive(:forecast)
      expect { subject.take_off(plane, weather) }.to raise_error("No such plane in hanger")
    end
    
    it "should recieve confirmation a plane has taken off" do
      allow(weather).to receive(:forecast)
      subject.land(plane, weather)
      expect(subject.take_off(plane, weather)).to eq("#{plane} has taken off")
    end
    
    it "it won't let the plane take_off if weather is stormy" do 
      allow(weather).to receive(:forecast)
      subject.land(plane, weather)
      allow(weather).to receive(:forecast).and_return("stormy")
      expect { subject.take_off(plane, weather) }.to raise_error("Weather too bad")
    end

  end
end
