require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :planes }
  it { is_expected.to respond_to :launch }

  describe '#land' do
    it 'lands a plane' do
      plane = double('plane')
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe '#launch' do
    it 'launches a plane' do
      plane = double('plane')
      subject.land(plane)
      expect(subject.launch).to eq plane
    end
    # it 'raises an error when weather is stormy' do
    #   plane = double('plane')
    #   subject.land(plane)
    #   weather = double()
    # end 
  end

  describe '#planes' do
    it 'reports the planes that are in the airport' do
      plane = double('plane')
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

end
