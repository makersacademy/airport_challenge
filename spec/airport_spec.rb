require 'airport.rb'

  describe Airport do
    let(:plane){double :plane}
    it {is_expected.to respond_to(:land).with(1).argument}

    it {is_expected.to respond_to(:take_off).with(1).argument}

    # it "Airport confirms the plane is taking off" do
    #   # airport = double(:airport, weather_is_stormy?: false, add_plane: subject, remove_plane: [])
    #   # subject.land(airport)
    #   # subject.take_off(airport)
    #   # expect(airport.planes).to eq []
    #   plane = Plane.new
    #   plane.land(subject)
    #   plane.take_off(subject)
    #   expect(subject.planes).to eq []
    # end
#..........................

it "confirms that a plane lands" do
  allow(subject).to receive(:weather_is_stormy?){false}
  subject.land(plane)
  expect(subject.planes).to include (plane)
end

it "confirmed that a plane takes off" do
  allow(subject).to receive(:weather_is_stormy?){false}
  subject.land(plane)
  subject.take_off(plane)
  expect(subject.planes).to eq []
end

it "prevents the plane from taking off when the weather is stormy" do
  allow(subject).to receive(:weather_is_stormy?){false}
  subject.land(plane)
  allow(subject).to receive(:weather_is_stormy?){true}
  expect{subject.take_off(plane)}.to raise_error "Plane can not take off due to stormy weather"
end

it "prevents the plane from landing when the weather is stormy" do
  allow(subject).to receive(:weather_is_stormy?){true}
  expect{subject.land(plane)}.to raise_error "Plane can not land due to stormy weather"
end

it "prevents landing when the airport is full" do
  allow(subject).to receive(:weather_is_stormy?){false}
  expect{11.times{subject.land(plane)}}.to raise_error "Plane can not land because the airport is full"
end

it "Airport has a default capacity" do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
end

it "Airport capacity can change to a new value" do
    subject.capacity= 12
    expect(subject.capacity).to eq 12
end

it "is full, one plane leaves, another plane can land in the airport " do
    allow(subject).to receive(:weather_is_stormy?){false}
    num = described_class::DEFAULT_CAPACITY
    planes = (0..num-1).map{double(:plane)}
    planes.each{|plane| subject.land(plane)}
    subject.take_off(planes[-1])
    plane = double(:plane)
    subject.land(plane)
end

it "can have more than one landed plane" do
  allow(subject).to receive(:weather_is_stormy?){false}
  subject.land(plane)
  plane2 = double(:plane)
  subject.land(plane2)
  expect(subject.planes).to include (plane)
  expect(subject.planes).to include (plane2)
end

it "has 2 planes landed, both take off, there is no plane in the airport" do
  allow(subject).to receive(:weather_is_stormy?){false}
  subject.land(plane)
  plane2 = double(:plane)
  subject.land(plane2)
  subject.take_off(plane)
  subject.take_off(plane2)
  expect(subject.planes).to eq []
end




end
