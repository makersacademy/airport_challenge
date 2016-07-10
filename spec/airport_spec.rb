require 'airport'

describe Airport do

describe '#land' do
  it {is_expected.to respond_to(:land).with(1).argument}

  it 'docks plane and returns confirmation' do
  allow(Weather).to receive(:clear?).and_return(true)
  plane = Plane.new
  expect(subject.land(plane)).to eq plane
  end

  it 'raises an error when stormy weather' do
    allow(Weather).to receive(:clear?).and_return(false)
    expect { subject.land(Plane.new)}.to raise_error("airport experiencing stormy weather")
  end

  it 'raises an error when airport full' do
    allow(Weather).to receive(:clear?) {true}
    subject.capacity.times { subject.land(Plane.new) }
    expect { subject.land Plane.new }.to raise_error("airport full")
  end

  it 'raises an error if plane has already landed' do
    allow(Weather).to receive(:clear?) {true}
    plane = Plane.new
    subject.land(plane)
    expect {subject.land(plane)}.to raise_error 'selected plane already landed at airport'
  end
end

describe '#take_off' do
  it {is_expected.to respond_to(:take_off).with(1).argument}

  it 'raises an error when stormy weather' do
    allow(Weather).to receive(:clear?) {true}
    subject.land(Plane.new)
    allow(Weather).to receive(:clear?).and_return(false)
    expect { subject.take_off(Plane.new) }.to raise_error("airport experiencing stormy weather")
  end

  it 'raises an error when no planes at airport' do
    allow(Weather).to receive(:clear?) {true}
    plane = Plane.new
    expect { subject.take_off(plane) }.to raise_error("no planes at airport")
  end

  # it 'takes off a plane and returns confirmation'
  # plane = Plane.new
  # airport = Airport.new
  # airport.land(plane)
  # expect(subject.take_off).to eq plane
end

end
