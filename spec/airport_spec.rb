require 'airport'

describe Airport do 
  it { is_expected.to respond_to(:land).with(1).argument }
  let(:plane) { instance_double Plane }

  describe '#land' do 
    it { is_expected.to respond_to(:land).with(1).argument }
  
    it 'is expected to land planes' do
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

  
  describe '#planes' do
    it { is_expected.to respond_to(:planes) }

    it 'is expected to initialize with no planes' do
      expect(subject.planes).to eq []
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'is expected to make a plane take off' do
      expect(subject.takeoff(plane)).to eq plane
    end
      
    it 'is expected to no longer contain after take_off' do  
      subject.land(test_plane)
      expect(subject.planes).to eq [test_plane]
      subject.take_off(test_plane)
      expect(subject.planes). to eq []
    end
  end
end
