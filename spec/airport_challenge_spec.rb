require './lib/plane'
require './lib/airport'
require './lib/weather'

describe Airport do
  let(:plane) { double :plane }
  before { allow(Weather).to receive(:stormy?) { false } }
  before { allow(plane).to receive(:landed).and_return(false) }
  before { allow(plane).to receive(:land).and_return(false) }
  before { allow(plane).to receive(:flying?).and_return(true) }
  before { allow(plane).to receive(:take_off).and_return(false) }
  
  describe '#land' do

    it 'instruct plane to land at airport' do
      subject.land(plane)
      expect(subject.planes.include? plane).to eq true
    end

    it 'raise error if landing a plane to full airport' do
      expect { (subject.capacity + 1).times { subject.land(plane) } }.to raise_error('Airport is full!')
    end

    it 'raise error if landing a plane & weather is stormy' do
      allow(Weather).to receive(:stormy?) { true }
      expect { subject.land(plane) } .to raise_error('Weather is stormy, cannot land')
    end

    it 'raise error if landing a plane that is already landed' do
      allow(plane).to receive(:landed).and_return(true)
      allow(plane).to receive(:land).and_return(true)
      allow(plane).to receive(:flying?).and_return(false)
      expect { subject.land(plane) }.to raise_error('Plane is already landed')
    end
  end

  describe '#take_off' do
    before { allow(plane).to receive(:landed).and_return(true) }
    before { allow(plane).to receive(:land).and_return(true) }
    before { allow(plane).to receive(:flying?).and_return(false) }

    it 'instruct plane to take off from airport' do
      subject.take_off(plane)
      expect(subject.planes.include? plane).to eq false
    end

    it 'raise error if a plane is taking off & weather is stormy' do
      allow(Weather).to receive(:stormy?) { true }
      expect { subject.take_off(plane) }.to raise_error('Weather is stormy, cannot take off')
    end

    it 'raise error if plane is flying' do
      allow(plane).to receive(:flying?) { true }
      expect { subject.take_off(plane) }.to raise_error('Plane is flying, cannot take off')
    end

    it 'confirm plane that has taken off is no longer in airport' do
      subject.take_off(plane)
      expect(subject.planes.include? plane).to eq false
    end

  end

  describe '#confirm_take_off' do
    it 'confrims take off' do
      expect(subject.confirm_take_off(plane)).to eq 'Plane has taken off.'
    end

    it 'raise error if confirming take off & plane is still at airport' do
      allow(plane).to receive(:land).and_return(true)
      allow(plane).to receive(:landed).and_return(true)
      allow(plane).to receive(:flying?).and_return(true)
      expect { subject.confirm_take_off(plane) }.to raise_error('Plane has not taken off.')
    end

  end

  it 'accepts capacity argument' do
    expect(Airport.new(25).capacity).to eq 25
  end

  it 'sets DEFAULT_CAPACITY if no capacity argument passed' do
    allow(plane).to receive(:landed).and_return(false)
    allow(plane).to receive(:land).and_return(false)
    allow(plane).to receive(:flying?).and_return(true)
    subject.capacity.times { subject.land(plane) }
    expect(subject.planes.count).to eq Airport::DEFAULT_CAPACITY
  end
  
end
