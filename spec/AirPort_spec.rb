require 'AirPort'

describe AirPort do

  it { is_expected.to respond_to :capacity }

  it 'Override the capacity' do
    subject.capacity= 400
    expect(subject.capacity).to eq(400)
  end

describe '#land a plane' do
  it 'raise Error if weather stormy' do
    sky = subject.weather
    while sky == 'sunny'
      sky = subject.weather
    end
    expect { subject.land(Plane.new) }.to raise_error('Impossible to land weather stormy!')
  end

  it 'raise Error if AirPort hangar full' do
    subject.capacity.times { subject.land Plane.new }
    expect { subject.land Plane.new }.to raise_error('AirPort reached max capacity!')
  end

  it 'check if plane landing is already in the hangar' do
    subject.land(Plane.new)
    subject.land(Plane.new)
    expect(subject.hangar[0] == subject.hangar[1]).to eq(false)
  end
end

  it 'check random weather' do
    allow(subject).to receive(:weather) { 'stormy' }
  end

  describe '#take_off a plane' do
    it 'raise Error if weather stormy' do
      sky = subject.weather
      while sky == 'sunny'
        sky = subject.weather
      end
      expect { subject.take_off }.to raise_error('Impossible to take off weather stormy!')
    end

    it 'Confirm plane left the hangar' do
      plane = subject.hangar[0] = Plane.new
      subject.take_off
      expect(subject.hangar.include?(plane)).to eq(false)
    end
  end
end
