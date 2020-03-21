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

  it 'land returns the string "plane"' do
    expect(subject.land).to eq "plane"
  end



  #it "Airport responds to #plane_left_hangar" do
  #  expect(subject).to respond_to(:plane_left_hangar)
  #end

  #it "Airport confirms #plane_left_hangar" do
  #  expect(subject.plane_left_hangar).to eq("Plane has left the airport")
  #end
end
