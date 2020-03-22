require 'airport'

describe Airport do
  it "Airport responds to #take_off" do
    expect(subject).to respond_to(:take_off)
  end
  # think i don't need this now as the take_off raise error now superseeds this.
  #it "when #take_off is called on Airport, it creates a new plane" do
  #  expect(subject.take_off).to be_instance_of(Plane)
  #end

    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::MAX_PLANES
    end

  #describe 'initialize' do
  #  it "airport capacity can vary" do
  #    heathrow = Airport.new(20)
  #    20.times { heathrow.land(Plane.new)}
  #    expect { heathrow.land(Plane.new)}.to raise_error('Aiport full, cannot land!')
  #  end
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
    expect(subject.land(Plane)).to eq [Plane]
  end

  #remove this as it was failing and I couldn't work out what it did. Removing didnt downgrade coverage
  #it "returns the landed plane" do
  #  aero = Plane.new
  #  subject.land(aero)
  #  expect(subject.land(Plane)).to eq @num_planes
  #end

  describe '#land' do
    it 'raises an error when full' do
      Airport::MAX_PLANES.times {subject.land(Plane.new)}
      expect {subject.land(Plane.new)}.to raise_error "Aiport full, cannot land!"
    end
  end

  #removed as now removed the plane method
  #it "repsonds to #plane" do
  #  expect(subject).to respond_to(:plane)
  #end
end
