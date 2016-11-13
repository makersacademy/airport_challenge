require 'airport.rb'

  describe Airport do

    let(:plane) { double :plane }

    context "Testing respond to methods" do

    it "should test that class airport responds to planes landing method" do
      expect(subject).to respond_to(:plane_landed).with(1).argument
    end

    it "should test that airport class response to planes method" do
      expect(subject).to respond_to :planes
    end

    it "should test that there is a response between airport class and take off method" do
      expect(subject).to respond_to :taken_off
    end

    it "should test that airport class response to capacity method" do
      expect(subject).to respond_to :capacity
    end

    it "should test that airport class responds to planes in flight method" do
      expect(subject).to respond_to :planes_in_flight
    end
  end

  context "Test result of response" do

    it "should equal plane that has landed" do
      saa_plane = double(:plane, :condition => :sunny)
        expect(subject.plane_landed(saa_plane)).to eq "Plane #{saa_plane} has landed"
    end

    it "should test that a plane has taken off from the airport" do
      saa_plane = double(:plane, :condition => :sunny)
      subject.plane_landed(saa_plane)
        expect(subject.taken_off).to eq "Plane #{saa_plane} has taken off"
    end

    it "should test that the planes avaiable will be shown when the method planes is called" do
      saa_plane = double(:plane, :condition => :sunny)
      subject.plane_landed(saa_plane)
        expect(subject.planes).to eq [saa_plane]
    end
  end


  context "Raise error" do

    it "should raise an error when the amount of planes in the airport if full and a plane is trying to land" do
      Airport::DEFAULT_CAPACITY.times {subject.plane_landed double(:plane, :condition => :sunny)}
       saa_plane = double(:plane, :condition => :sunny)
        expect{subject.plane_landed(saa_plane)}.to raise_error("This airport is full to capacity, please go to the next nearest airport to land")
    end

    it "should raise an error that indicates a plane cannot land due to weather" do
       plane = double(:plane, :condition => :stormy)
       expect{subject.plane_landed(plane)}.to raise_error("There is a storm at destination please divert to nearest airport")
     end

  end
end
