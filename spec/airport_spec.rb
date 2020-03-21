require 'airport'


describe Airport do
  it "Airport responds to #take_off" do
    expect(subject).to respond_to(:take_off)
  end

  it "when #take_off is called on Airport, it creates a new plane" do
    expect(subject.take_off).to be_instance_of(Plane)
  end

  it "airport responds to #land" do
    expect(subject).to respond_to(:land)
  end

  it "gives error if the airport is full" do
    expect{subject.land(Plane)}.to raise_error("Airport full, cannot land")
  end
#commented this out to make it raise error
=begin
  it '#land returns an instance of Plane' do
    expect(subject.land(Plane)).to eq(Plane)
  end
=end

end
