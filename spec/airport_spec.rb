require 'airport'
describe Airport do
  it "confirms plane landing at airport" do
    expect(subject).to respond_to :receive_plane
    plane = Plane.new
    expect(subject.receive_plane(plane)).to include(plane)
  end

  it "confirms plane taking off at airport and no longer at airport" do
    expect(subject).to respond_to :release_plane
    plane = Plane.new
    subject.receive_plane(plane)
    expect(subject.release_plane(plane)).to eq(plane)
  end

  it "generates stormy weather if roll equals to 2" do
    stormy = double(Airport.new, :weather => "sunny")
    allow(stormy).to receive(:roll).and_return(2)
    expect(stormy.roll).to eq 2
  end

  it "generates sunny weather if roll equals to 1" do
    sunny = double(Airport.new, :weather => "sunny")
    allow(sunny).to receive(:roll).and_return(1)
    expect(sunny.roll).to eq 1
  end

  it "raises error to land plane when stormy weather" do
    weat = double(Airport.new, :weather => "stormy")
    plane = Plane.new
    expect{weat.receive_plane(plane)}.to raise_error
  end

  it "raises error to takeoff plane when stormy weather" do
    plane = Plane.new
    weat = double(Airport.new, :weather => "stormy", :plane => plane)
    expect{weat.release_plane(plane)}.to raise_error 
  end

  it "raises error to land plane when airport is full" do
    plane = Plane.new
    airport = Airport.new
    5.times{airport.receive_plane(plane)}
    expect{airport.receive_plane(plane)}.to raise_error ("Airport is full, unable to land")
  end

  it "raises error to takeoff plane when airport is empty" do
    plane = Plane.new
    airport = Airport.new
    expect{airport.release_plane(plane)}.to raise_error ("Airport is empty, no planes to takeoff")
  end
end
