require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  it 'allows system designer to override default capacity' do
    expect(Airport).to respond_to(:new).with(1).argument
  end

  it 'initializes with an empty hangar' do
    expect(subject.hangar).to be_empty
  end

  it 'initializes with the default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'initializes with a chosen capacity' do
    expect(Airport.new(20).capacity).to eq 20
  end

  it 'responds to instruction "land"' do
    is_expected.to respond_to(:land)
  end

  it 'responds to instruction "take_off"' do
    is_expected.to respond_to(:take_off)
  end

  describe '#land' do
    it 'takes a plane as an argument' do
      is_expected.to respond_to(:land).with(1).argument
    end

    it 'stores the plane in the hangar' do
      subject.land(plane)
      expect(subject.hangar[-1]).to eq plane
    end

    it 'raises error when airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end

  end

  describe '#take_off' do
    it 'takes a plane as an argument' do
      is_expected.to respond_to(:take_off).with(1).argument
    end

    it 'removes plane from hangar' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.hangar).to eq nil
    end

  end
end
