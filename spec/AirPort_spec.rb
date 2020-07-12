require 'AirPort'

describe AirPort do

  it 'land a plane' do
    expect(subject.land).to eq('A new plane arrived!')
  end

  it 'take_off a plane' do
    subject.land
    expect(subject.take_off).to eq('Plane left the Ariport!')
  end

  it 'Confirm plane in the air, not in the hangar' do
    subject.land
    plane = subject.hangar[0]
    subject.take_off
    expect(subject.hangar.include?(plane)).to eq(false)
  end
end
