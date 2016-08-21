require 'plane'

describe Plane do
  it 'confirms whether the plane has landed at the airport' do
    expect(subject).to be_landed
  end

  it 'confirms whether the plane has taken off' do
    expect(subject.takeoff?).to eq true
  end

end
