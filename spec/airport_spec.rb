require 'airport'

describe Airport do
  #subject { Airport.new }
  it 'lands a plane at an airport' do
    expect(subject.land(plane)).to eq plane
  end
end
