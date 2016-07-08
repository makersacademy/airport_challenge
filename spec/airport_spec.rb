require "airport"

describe Airport do
  it "responds to land_plane" do
    expect(subject).to respond_to(:land_plane).with(1).argument
  end

  it 'take_off returns an instance of the Plane class' do
    weather = Weather.new
    allow(weather).to receive(:random_day).and_return(1)
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.take_off).to be_a Plane
  end

#  it "allows planes to take off when not stormy" do
    #bike = subject.release_bike
    #expect(bike).to be_working
#  end
#  it "docks a bike" do
#    expect(subject).to respond_to(:dock_bike)
#  end
end


  #expect an instance of dockingstation to return a working bike when release bike called

#  it "releases a working bike" do
#    bike = subject.release_bike
#    expect(bike.working?).to eq true
#  end
