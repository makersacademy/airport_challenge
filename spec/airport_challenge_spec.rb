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
end
