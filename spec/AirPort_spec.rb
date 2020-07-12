require 'AirPort'

describe AirPort do

  it 'land a plane' do
    expect(subject.land).to be_a(Plane)
  end
end
