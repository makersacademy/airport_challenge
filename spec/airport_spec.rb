require 'airport'


describe Airport do

  let(:plane) { double :plane, flying?: false }
  let(:plane_2) { double :plane }

  before do
    allow(subject).to receive(:weather) { :sunny }
  end

  it { is_expected.to respond_to(:make_take_off).with(1).argument }
  it { is_expected.to respond_to(:make_land).with(1).argument }

  it 'has a default capacity' do 
    expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
  end

  it 'instructs a plane to take off' do
    allow(plane).to receive(:flying?) { false }
    expect(plane).to receive(:take_off)
    subject.make_take_off(plane)
  end

  it 'releases a plane' do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
    allow(plane).to receive(:flying?) { false }
    subject.make_land(plane)
    expect(subject.make_take_off(plane)).to be plane
  end

  it 'should not be able to take off if already flying' do
    allow(subject).to receive(:weather) { :sunny }
    allow(plane).to receive(:land)
    subject.make_land(plane)
    allow(plane).to receive(:take_off)
    allow(plane).to receive(:flying?) { false }
    subject.make_take_off(plane)
    allow(plane).to receive(:flying?) { true }
    expect { subject.make_take_off(plane) }.to raise_error 
      'Plane has already taken off'
  end

  it 'should not land the same plane twice' do
    allow(plane).to receive(:land)
    subject.make_land(plane)
    expect { subject.make_land(plane) }.to raise_error 
      'Plane has already landed'
  end

  it 'instructs a plane to land' do 
    expect(plane).to receive(:land)
    subject.make_land(plane)
  end

  it 'receives a plane' do 
    allow(plane).to receive(:land)
    expect(subject.make_land(plane)).to be plane 
  end

  context 'when airport is full' do

    it 'does not allow a plane to land when at capacity' do
      airport = Airport.new(1)
      allow(airport).to receive(:weather) { :sunny }
      allow(plane).to receive(:land)
      airport.make_land(plane)
      allow(plane_2).to receive(:land)
      expect { airport.make_land(plane_2) }.to raise_error 
        'Airport is full'
    end

  end

  context 'when weather conditions are stormy' do

    it 'does not allow a plane to take off' do
      allow(plane).to receive(:land)
      allow(plane).to receive(:flying?) { true }
      subject.make_land(plane)
      allow(plane).to receive(:flying?) { false }
      allow(subject).to receive(:weather) { :stormy }
      allow(plane).to receive(:take_off)
      expect { subject.make_take_off(plane) }.to raise_error 
        'The weather is too stormy'
    end

    it 'does not allow a plane to land' do
        allow(subject).to receive(:weather) { :stormy }
        allow(plane).to receive(:land)
        expect { subject.make_land(plane) }.to raise_error 
          'The weather is too stormy'
      end

  end

end
