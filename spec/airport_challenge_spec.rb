require './docs/plane'
require './docs/airport'
describe Airport do
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
    expect(subject.confirm_take_off(plane)).to eq 'Plane has left the airport'
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
end
