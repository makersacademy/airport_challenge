require 'airport.rb'

  describe Airport do
    let(:plane){double :plane}
    it {is_expected.to respond_to(:land).with(1).argument}

    it {is_expected.to respond_to(:take_off).with(1).argument}

it "confirms that a plane lands" do
  allow(subject).to receive(:weather_is_stormy?){false}
  allow(plane).to receive(:landed){false}
  allow(plane).to receive(:landed=){true}
  subject.land(plane)
  expect(subject.planes).to include (plane)
end

it "confirmed that a plane takes off" do
  allow(subject).to receive(:weather_is_stormy?){false}
  allow(plane).to receive(:landed){false}
  allow(plane).to receive(:landed=){true}
  subject.land(plane)
  subject.take_off(plane)
  expect(subject.planes).to eq []
end

describe '#take_off' do
it "prevents the plane from taking off when the weather is stormy" do
  allow(subject).to receive(:weather_is_stormy?){false}
  allow(plane).to receive(:landed){false}
  allow(plane).to receive(:landed=){true}
  subject.land(plane)
  allow(subject).to receive(:weather_is_stormy?){true}
  expect{subject.take_off(plane)}.to raise_error "Plane can not take off due to stormy weather"
  end
end

describe '#land' do
it "prevents the plane from landing when the weather is stormy" do
  allow(subject).to receive(:weather_is_stormy?){true}
  expect{subject.land(plane)}.to raise_error "Plane can not land due to stormy weather"
  end
end

describe '#land' do
it "prevents landing when the airport is full" do
  allow(subject).to receive(:weather_is_stormy?){false}
  planes = (0..10).map do
    plane = double(:plane)
    allow(plane).to receive(:landed){false}
    allow(plane).to receive(:landed=){true}
    plane
  end

  expect{planes.each{|plane| subject.land(plane)}}.to raise_error "Plane can not land because the airport is full"
  end
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
    planes.each do |plane|
      allow(plane).to receive(:landed){false}
      allow(plane).to receive(:landed=){true}
      subject.land(plane)
    end
    subject.take_off(planes[-1])
    plane = double(:plane)
    allow(plane).to receive(:landed){false}
    allow(plane).to receive(:landed=){true}
    subject.land(plane)
end

it "can have more than one landed plane" do
  allow(subject).to receive(:weather_is_stormy?){false}
  allow(plane).to receive(:landed){false}
  allow(plane).to receive(:landed=){true}
  subject.land(plane)
  plane2 = double(:plane)
  allow(plane2).to receive(:landed){false}
  allow(plane2).to receive(:landed=){true}
  subject.land(plane2)
  expect(subject.planes).to include (plane)
  expect(subject.planes).to include (plane2)
end

it "has 2 planes landed, both take off, there is no plane in the airport" do
  allow(subject).to receive(:weather_is_stormy?){false}
  allow(plane).to receive(:landed){false}
  allow(plane).to receive(:landed=){true}
  subject.land(plane)
  plane2 = double(:plane)
  allow(plane2).to receive(:landed){false}
  allow(plane2).to receive(:landed=){true}
  subject.land(plane2)
  subject.take_off(plane)
  subject.take_off(plane2)
  expect(subject.planes).to eq []
end

describe '#land' do
it "should not allow a landed plane lands again" do
  allow(subject).to receive(:weather_is_stormy?){false}
  allow(plane).to receive(:landed){false}
  allow(plane).to receive(:landed=){true}
  subject.land(plane)
  expect{subject.land(plane)}.to raise_error "The plane is already landed"
  end
end

describe '#take_off' do
it "Should not allow a plane take off twice" do
  allow(subject).to receive(:weather_is_stormy?){false}
  allow(plane).to receive(:landed){false}
  allow(plane).to receive(:landed=){true}
  subject.land(plane)
  subject.take_off(plane)
  expect{subject.take_off(plane)}.to raise_error "The plane is already taken off"
  end
end


it "can not land in another airport when already landed" do
  allow(subject).to receive(:weather_is_stormy?){false}
  allow(plane).to receive(:landed){false}
  allow(plane).to receive(:landed=){true}
  subject.land(plane)
  allow(plane).to receive(:landed){true}
  airport2 = described_class.new
  allow(airport2).to receive(:weather_is_stormy?){false}
  expect{airport2.land(plane)}.to raise_error "plane already landed in another airport"
end

end
