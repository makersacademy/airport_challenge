require 'airport'
 
plane = Plane.new

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it 'creates a new instance' do
    expect(subject).to be_a Airport
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'lands a plane and stores the fact that the plane has landed' do
      expect(subject.land(:plane)).to include :plane
    # expect(subject.land(plane)).to eq([plane])
    end
  end

  describe '#take off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'takes off a plane' do
      subject.land(:plane)
      subject.take_off(:plane)
      expect(subject.planes.include?(plane)).to eq false
    end

    it 'confirms that a plane has left the airport once taken off' do
      subject.land(:plane)
      expect(subject.take_off(:plane)).to eq("The plane has taken off and left the airport")
    end
  end
end

# other tests

  #   it 'checks that the plane has landed before it takes off'

  #   it 'checks that if there are multiple planes in the airport, the correct plane takes off'

  #   it 'doesnt allow a plane to take off if there are no planes'
