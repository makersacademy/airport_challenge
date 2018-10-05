require 'airport'

describe Airport do
  it 'lands a plane' do
    expect(subject.land(plane)).to eq plane
  end

end
