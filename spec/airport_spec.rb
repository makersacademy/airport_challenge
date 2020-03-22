require 'airport'

describe Airport do
  it "Airport responds to #take_off" do
    expect(subject).to respond_to(:take_off)
  end
  # think i don't need this now as the take_off raise error now superseeds this.
  #it "when #take_off is called on Airport, it creates a new plane" do
  #  expect(subject.take_off).to be_instance_of(Plane)
  #end

  describe "#take_off" do
    it "raises error when no planes are available" do
      expect{subject.take_off}.to raise_error("No planes available to fly")
    end
  end

  it "responds to #land with one argument" do
     expect(subject).to respond_to(:land).with(1).argument
  end


  # are the three below tests all necessary?
  it "lands a aeroplane" do
    expect(subject.land(Plane)).to eq Plane
  end

  it "returns the landed plane" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  describe '#land' do
    it 'raises an error when full' do
      subject.land(Plane.new)
      expect {subject.land(Plane.new)}.to raise_error "Aiport full, cannot land!"
    end
  end

  it "repsonds to #plane" do
    expect(subject).to respond_to(:plane)
  end
end
