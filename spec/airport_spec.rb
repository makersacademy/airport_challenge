require 'airport.rb'



describe Airport do

  let (:weather) { Weather.new }
  let (:plane) {Plane.new}

  context "Good weather" do
    it "responds to #land" do
  		expect(subject).to respond_to(:land).with(1).argument
  	end

    it "confirms that plane has landed" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end

    it "responds to #take_off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it "confirms that plane is no longer in the airport" do
      subject.planes = [plane]
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end
  end

  context "Bad weather" do
    it "raises an error when trying to #land if #stormy?" do
      expect(subject).to receive(:stormy?).and_return(true) #stub
      expect {subject.land(plane)}.to raise_error("Impossible to land")
    end

    it "raises an error when trying to #take_off if #stormy?" do
      expect(subject).to receive(:stormy?).and_return(true) #stub
      expect {subject.take_off(plane)}.to raise_error("Impossible to take off")
    end
  end



end
