require 'airport'
describe Airport do
  it 'creates an instance of Airport' do
    expect(subject).to be_instance_of Airport
  end
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  describe '#land' do
    it 'returns landed planes' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    it 'raises an error if the airport is full' do
        20.times { subject.land(Plane.new) }
      expect(subject.land(Plane.new)).to raise_error 'airport is full'
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off' do
        plane = Plane.new
        subject.land(plane)
        expect(subject.take_off).to eq plane
    end

    it 'plane will not be in the airport' do
        plane = Plane.new
        subject.land(plane)
        subject.take_off
        expect(subject.planes).not_to include plane
    end
  end
end