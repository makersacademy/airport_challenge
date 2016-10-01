require 'plane'

describe Plane do
  it 'lands at airport' do
    expect(subject.land).to be true
  end

  it 'takes off from airport' do
    expect(subject.take_off).to be true
  end

end
