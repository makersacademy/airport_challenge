require 'airport.rb'



describe Airport do

  let (:weather) { Weather.new }
  let (:plane) {Plane.new}

  context "At initialization" do
    it "has default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "allows user to change capacity" do
      subject.capacity = 50
      expect(subject.capacity).to eq 50
    end
    # => PRIVATE
    # it "stats with 0 planes" do
    #   expect(subject.planes).to eq []
    # end

  end
  context "Good weather" do
    it "responds to #land" do
  		expect(subject).to respond_to(:land).with(1).argument
  	end
    # => PRIVATE
    # it "confirms that plane has landed" do
    #   allow(subject).to receive(:stormy?).and_return(false)
    #   subject.land(plane)
    #   expect(subject.planes).to eq [plane]
    # end

    it "responds to #take_off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    # => PRIVATE
    # it "confirms that plane is no longer in the airport" do
    #   allow(subject).to receive(:stormy?).and_return(false)
    #   subject.planes = [plane]
    #   subject.take_off(plane)
    #   expect(subject.planes).to eq []
    # end
    it "changes origin to Current Airport when landed" do
      allow(subject).to receive(:empty?).and_return(false) #stub
      allow(subject).to receive(:stormy?).and_return(false) #stub
      subject.land(plane)
      expect(plane.origin).to eq Airport::AIRPORT_CODE
    end
    # => PRIVATE
    # it "#take_off raises error if plane is not in the airport" do
    #   allow(subject).to receive(:empty?).and_return(false) #stub
    #   allow(subject).to receive(:stormy?).and_return(false) #stub
    #   expect(subject.planes).not_to include(plane)
    #   expect {subject.take_off(plane)}.to raise_error("Plane not in airport")
    # end
    #
    # it "#land raises error if plane is not in the airport" do
    #   allow(subject).to receive(:empty?).and_return(false) #stub
    #   allow(subject).to receive(:stormy?).and_return(false) #stub
    #   allow(subject).to receive(:full?).and_return(false)
    #   subject.planes << plane
    #   expect(subject.planes).to include(plane)
    #   expect {subject.plane(plane)}.to raise_error("Plane already landed")
    # end
  end

  context "Bad weather" do
    it "raises an error when trying to #land if #stormy?" do
      allow(subject).to receive(:stormy?).and_return(true) #stub
      expect {subject.land(plane)}.to raise_error("Impossible to land")
    end

    it "raises an error when trying to #take_off if #stormy?" do
      allow(subject).to receive(:empty?).and_return(false) #stub
      allow(subject).to receive(:stormy?).and_return(true) #stub
      expect {subject.take_off(plane)}.to raise_error("Impossible to take off")
    end
  end

  # => PRIVATE
  # context "Airport full" do
  #   it "raises an error when trying to #land in a full airport" do
  #     allow(subject).to receive(:stormy?).and_return(false)
  #     Airport::DEFAULT_CAPACITY.times {subject.planes << Plane.new}
  #     expect {subject.land(plane)}.to raise_error("Airport full")
  #   end
  # end

  context "Airport empty" do
    it "raises an error when trying to #take_off from an empty airport" do
      allow(subject).to receive(:stormy?).and_return(false)
      expect {subject.take_off(plane)}.to raise_error("Airport empty")
    end
  end

end
