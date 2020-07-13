require 'AirPort'

describe AirPort do

describe '#land a plane'
  it 'raise Error if AirPort hangar full' do
    200.times { subject.land }
    expect { subject.land }.to raise_error('AirPort reached max capacity!')
  end

  it 'take_off a plane' do
    subject.land
    expect(subject.take_off).to eq('Plane left the Ariport!')
  end

  it 'Confirm plane left the hangar' do
    subject.land
    plane = subject.hangar[0]
    subject.take_off
    expect(subject.hangar.include?(plane)).to eq(false)
  end
end
