require './docs/plane'
require './docs/airport'
require './docs/weather'


describe Airport do
  before { allow(Weather).to receive(:stormy?) { false } }

  it { is_expected.to respond_to :land }

  it 'instruct plane to land at airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes.include? plane).to eq true
  end

  it 'instruct plane to take off from airport' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.planes.include? plane).to eq false
  end

  it 'confirm plane that has taken off is no longer in airport' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.confirm_take_off(plane)).to eq 'Plane not at the airport'
  end

  it 'raise error if confirming take off and plane is still at airport' do
    plane = Plane.new
    subject.land(plane)
    expect {subject.confirm_take_off(plane)}.to raise_error('Plane has not taken off.')
  end

  it 'raise error if landing a plane to full airport' do
    expect {(Airport::DEFAULT_CAPACITY + 1).times {subject.land(Plane.new)}}.to raise_error('Airport is full!')
  end

  it 'accepts DEFAULT_CAPACITY of planes' do
    Airport::DEFAULT_CAPACITY.times {subject.land(Plane.new)}
    expect(subject.planes.count).to eq Airport::DEFAULT_CAPACITY
  end

  it 'raise error if landing a plane & weather is stormy' do
    plane = Plane.new
    allow(Weather).to receive(:stormy?) { true }
    expect {subject.land(plane)}.to raise_error('Weather is stormy, cannot land')
  end

  it 'raise error if a plane is taking off & weather is stormy' do
    plane = Plane.new
    allow(Weather).to receive(:stormy?) { true }
    expect {subject.take_off(plane)}.to raise_error('Weather is stormy, cannot take off')
  end
end
