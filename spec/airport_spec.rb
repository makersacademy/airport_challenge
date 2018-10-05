require 'airport'

describe Airport do
  it 'should be able to land a plane' do
    expect { subject.land(plane) }.not_to raise_error
  end
end
