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
  it 'enables plane to leave airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off).to eq "plane has left the airport"
end
end

end
