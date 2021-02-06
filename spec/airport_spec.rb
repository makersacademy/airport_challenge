require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'confirms a plane has landed' do
    plane = Plane.new
    expect(subject.land(plane)).to eq [plane]
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off).to eq [plane]
    end
  end

  describe '#land' do
    it 'raises an error if the aiport is full' do
    subject.capacity.times { subject.land(Plane.new) }
    expect{ subject.land Plane.new }.to raise_error 'Warning, airport full'
    end
  end

  describe '#initialize' do
    it 'has a variable capacity' do
      ap = Airport.new(40)
      40.times { ap.land Plane.new }
      expect{ ap.land Plane.new }.to raise_error 'Warning, airport full'
    end
  end

end
