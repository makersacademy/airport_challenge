require 'Airport'
require 'plane'


describe Airport do

  it 'when 8 is passed as an initialized argument, hangar capacity will be 8' do
      expect(Airport.new(8).capacity).to eq 8
    end

    it 'sets capacity to default, 10, if no capacity is given as an argument' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end


  describe '#land' do
  it 'responds to method "land"' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'can store a plane in an array' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
end

  it 'can prevent a plane from landing if its too stormy' do
    plane = Plane.new
    allow(subject).to receive(:rand) {"stormy"}
    subject.check_weather
    expect {subject.land(plane)}.to raise_error "too stormy to land"
  end

  it "prevents a plane from landing if hangar is full" do
  Airport::DEFAULT_CAPACITY.times {subject.land(Plane.new)}
  expect {subject.land(Plane.new)}.to raise_error "hangar is full"
  end


end

describe '#take_off' do

  it 'responds to method "take-off"' do
    expect(subject).to respond_to(:take_off)
  end

  it 'raises error if hangar is empty' do
    expect {subject.take_off}.to raise_error "hangar is empty"
  end

  it 'prevents take-off if stormy' do
    plane = Plane.new
    subject.land(plane)
    allow(subject).to receive(:rand) {"stormy"}
    subject.check_weather
    expect {subject.take_off}.to raise_error "too stormy for take-off"
  end

  it 'enables plane to leave airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq "plane has left the airport"
end
end

describe '#check_weather' do
  it 'can check the weather' do
  #allow(subject).to receive(:check_weather) {"sunny"}
  expect(subject.check_weather).to eq(nil).or eq(true)
  end
 end

describe '#report_storm' do
  it 'reports a storm if the weather is stormy' do
    allow(subject).to receive(:rand) {"stormy"}
    expect(subject.check_weather).to eq true

  end
end
end
