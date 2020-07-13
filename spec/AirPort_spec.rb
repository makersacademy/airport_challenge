require 'AirPort'

describe AirPort do

  it { is_expected.to respond_to :capacity }

  it 'Override the capacity' do
    subject.capacity= 400
    expect(subject.capacity).to eq(400)
  end

describe '#land a plane'
  it 'raise Error if AirPort hangar full' do
    subject.capacity.times { subject.land }
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
