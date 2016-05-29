require 'airport.rb'



describe Airport do

  let(:weather) { Weather.new }
  let(:plane) {Plane.new}

  context "At initialization" do
    it "has default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it "allows user to change capacity" do
      subject.capacity = 50
      expect(subject.capacity).to eq 50
    end
    # => PRIVATE. Commented methods break class encapsulation.
    # Specs are all about testing behavior of an object
    # and testing behaviour by breaking class encapsulation with
    # instance_eval will make your tests more fragile and implementation
    # dependent. See: http://stackoverflow.com/questions/9038483/
    # how-to-set-private-instance-variable-used-within-a-method-test
    # it "stats with 0 planes" do
    #   expect(subject.instance_variable_get(:@planes)).to eq []
    # end

  end
  context "Good weather" do
    it "responds to #land" do
  		expect(subject).to respond_to(:land).with(1).argument
    end

    # it "confirms that plane has landed" do
    #   allow(subject).to receive(:stormy?).and_return(false)
    #   subject.land(plane)
    #   expect(subject.instance_variable_get(:@planes)).to eq [plane]
    # end

    it "responds to #take_off" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    # it "confirms that plane is no longer in the airport" do
    #   allow(subject).to receive(:stormy?).and_return(false)
    #   subject.instance_variable_set(:@planes, [plane])
    #   subject.take_off(plane)
    #   expect(subject.instance_variable_get(:@planes)).to eq []
    # end
    it "changes origin to Current Airport when landed" do
      allow(subject).to receive(:empty?).and_return(false) #stub
      allow(subject).to receive(:stormy?).and_return(false) #stub
      subject.land(plane)
      expect(plane.origin).to eq Airport::AIRPORT_CODE
    end

    # it "#take_off raises error if plane is not in the airport" do
    #   allow(subject).to receive(:empty?).and_return(false) #stub
    #   allow(subject).to receive(:stormy?).and_return(false) #stub
    #   expect(subject.instance_variable_get(:@planes)).not_to include(plane)
    #   expect {subject.take_off(plane)}.to raise_error(Airport::TAKE_OFF_MSG)
    # end
    #
    # it "#land raises error if plane is already the airport" do
    #   allow(subject).to receive(:empty?).and_return(false) #stub
    #   allow(subject).to receive(:stormy?).and_return(false) #stub
    #   allow(subject).to receive(:full?).and_return(false)
    #   subject.instance_variable_set(:@planes, [plane])
    #   expect {subject.land(plane)}.to raise_error(Airport::LANDED_MSG)
    # end
  end

  context "Bad weather" do
    it "raises an error when trying to #land if #stormy?" do
      allow(subject).to receive(:stormy?).and_return(true) #stub
      expect {subject.land(plane)}.to raise_error(Airport::STORM_MSG)
    end

    it "raises an error when trying to #take_off if #stormy?" do
      allow(subject).to receive(:empty?).and_return(false) #stub
      allow(subject).to receive(:stormy?).and_return(true) #stub
      expect {subject.take_off(plane)}.to raise_error(Airport::STORM_MSG)
    end
  end

  # => PRIVATE
  # context "Airport full" do
  #   it "raises an error when trying to #land in a full airport" do
  #     allow(subject).to receive(:stormy?).and_return(false)
  #     Airport::DEFAULT_CAPACITY.times {subject.planes << Plane.new}
  #     expect {subject.land(plane)}.to raise_error(Airport::FULL_MSG)
  #   end
  # end

  context "Airport empty" do
    it "raises an error when trying to #take_off from an empty airport" do
      allow(subject).to receive(:stormy?).and_return(false)
      expect {subject.take_off(plane)}.to raise_error(Airport::EMPTY_MSG)
    end
  end

end
