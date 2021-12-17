require 'airport'

describe Airport do
  it 'lets an air traffic controller instruct a plane to land at an aiport' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  describe '#take_off' do
    it 'lets an air traffic controller instruct a plane to take off from an airport' do
      expect(subject).to respond_to(:take_off)
    end
    it 'raises an error when a plane tries to land when the airport is full' do
      Airport::CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "The plane cannot land as airport is at capacity"
    end
  end

  it 'confirms that a plane which has just taken off is no longer at the airport' do
    2.times { subject.land(Plane.new) }
    subject.take_off
    expect(subject.gone?).to eq true
  end

  it 'lets the Default Capacity of an airport be overridden' do
    subject.override_capacity(10)
    expect(Airport::CAPACITY).to eq 10
    # expect(subject).to respond_to(:override_capacity).with(1).argument
  end
end
