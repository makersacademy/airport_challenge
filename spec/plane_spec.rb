require 'plane'

describe Plane do

  it 'instructs plane to land at airport' do
    expect(subject).to respond_to(:land)
  end

  it 'allows plane to take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'lets us know if the plane is at the airport' do
    subject.take_off
    expect(subject.airborne).to eq true
  end

end