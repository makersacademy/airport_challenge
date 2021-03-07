require 'Airport'
describe Airport do
    heathrow = Airport.new
    plane = Plane.new
  #I can instruct a plane to land at an airport.
  it {is_expected.to respond_to :land_plane }
  #I can instruct a plane to take-off.
  it {is_expected.to respond_to :take_off }
  #I can confirm the plane is no longer at the airport.
  it "releases a plane for take off" do
     subject.land_plane(plane)
     expect(subject.take_off).to eq plane
  end
  it { is_expected.to respond_to(:land_plane).with(1).argument}
  it "lands a plane" do
    expect(subject.land_plane(plane)).to eq plane
  end
  it "raises an error when the airport capacity is already full" do
    Airport::CAPACITY.times {subject.land_plane(plane)}
    expect { subject.land_plane(plane) }.to raise_error 'Airport is full'
  end

  #The plane can't take off or land if the weather is bad
describe Weather do
  it "Says you can't land or take off if weather is stormy" do
    allow(subject).to receive(:rand).and_return(5)
    expect(subject.weather_report).to eq 'Stormy weather, airport closed.'
  end
end
end
