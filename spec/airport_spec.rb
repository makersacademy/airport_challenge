require 'airport'

describe Airport do
  it {is_expected.to respond_to :plane_land}

  it 'confirms landed plane' do
    plane = subject.plane_land
    expect(plane).to be_landed
  end

  it 'confirms that the plane has taken off' do
    plane = subject.plane_take_off
    expect(plane).to be_taken_off
  end
end
