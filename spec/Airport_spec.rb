require 'Airport'
require 'plane'


describe Airport do

  describe '#land' do
  it 'responds to method "land"' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'can store a plane in an array' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]


end
end

describe '#take_off' do

  it 'responds to method "take-off"' do
    expect(subject).to respond_to(:take_off)
  end

  it 'raises error if hangar is empty' do
    expect {subject.take_off}.to raise_error "hangar is empty"
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
