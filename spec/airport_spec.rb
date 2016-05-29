require 'airport.rb'



describe Airport do

  let (:weather) { Weather.new }

  context "good weather" do
    it "responds to #land" do
  		expect(subject).to respond_to(:land).with(1).argument
  	end

    it "confirms that plane has landed" do
      plane = Plane.new
      allow(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  context "bad weather" do
    it "responds to #take_off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it "confirms that plane is no longer in the airport" do
      plane = Plane.new
      subject.planes = [plane]
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end

    it "raises an error when trying to #land if #stormy?" do
      plane = Plane.new
      expect(subject).to receive(:stormy?).and_return(true)
      expect {subject.land(plane)}.to raise_error("Impossible to land")
    end
  end



end
