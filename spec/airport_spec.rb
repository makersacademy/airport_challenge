require 'airport'

describe Airport do 
  it { is expected_to respond_to(:land).with(1).argument }
  let(:plane) { instance_double Plane }

  describe '#land' do 
    it { is_expected.to respond_to(:land).with(1).argument }
  end
    
  describe '#planes' do
    it { is_expected.to respond_to(:planes) }

    it 'is expected to initialize with no planes' do
      expect(subject.planes).to eq []
    end
  end
end
