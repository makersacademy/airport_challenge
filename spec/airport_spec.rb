require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:flying_plane) { double :plane, status = 'flying' }
  let(:landed_plane) { double :plane, status = 'landed' }

  it 'sets a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'allows the setting of a capacity' do
    capacity = rand(1..35)
    expect(Airport.new(capacity).capacity).to eq capacity
  end

  describe '#land' do
    it 'stores landed planes at the airport' do
      allow(plane).to receive(:landed)
      allow(subject).to receive(:current_weather) { 'fine' }
      n = rand(1..5)
      n.times { subject.land plane }
      expect(subject.planes.length).to eq n
    end
    it 'changes the status of the landed plane' do
      allow(subject).to receive(:current_weather) { 'fine' }
      allow(plane).to receive(:landed)
      allow(plane).to receive(:status).and_return(subject)
      subject.land plane
      expect(plane.status).to eq subject
    end
    it 'will not allow planes to land when stormy' do
      allow(subject).to receive(:current_weather) { 'stormy' }
      allow(plane).to receive(:landed)
      expect { subject.land plane }.to raise_error 'Too stormy to try landing'
    end
    it 'will not allow planes to land when full' do
      allow(subject).to receive(:current_weather) { 'fine' }
      allow(plane).to receive(:landed).and_return(plane)
      Airport::DEFAULT_CAPACITY.times { subject.land plane }
      expect { subject.land plane }.to raise_error 'This airport is full'
    end
  end

  describe '#take_off' do
    it 'will only allow a plane to take off if at that airport' do
      allow(subject).to receive(:current_weather) { 'fine' }
      allow(plane).to receive(:landed).and_return(plane)
      airport_1 = Airport.new
      airport_2 = Airport.new
      airport_1.land(plane)
      expect { airport_2.take_off(plane) }.to raise_error 'Plane not at this airport'
    end
    it 'will not allow planes to take off when stormy' do
      allow(subject).to receive(:current_weather) { 'stormy' }
      allow(plane).to receive(:landed).and_return(plane)
      subject.land plane
      expect { subject.take_off(plane) }.to raise_error 'Too stormy to try take off'
    end
  end

end
