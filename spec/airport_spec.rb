require 'airport'

describe Airport do

describe '#land' do
  it {is_expected.to respond_to(:land).with(1).argument}

  it 'docks plane and returns confirmation' do
  plane = Plane.new
  expect(subject.land(plane)).to eq plane
  end
end

describe '#take_off' do
  it {is_expected.to respond_to(:take_off)}

  it 'raises an error when stormy weather' do
    allow(Weather).to receive(:clear?) {true}
    subject.land(Plane.new)
    allow(Weather).to receive(:clear?).and_return(false)
    expect { subject.take_off }.to raise_error("airport experiencing stormy weather")
  end

  # it 'takes off a plane and returns confirmation'
  # plane = Plane.new
  # airport = Airport.new
  # airport.land(plane)
  # expect(subject.take_off).to eq plane
end

end
