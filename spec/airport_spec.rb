require 'airport'

describe Airport do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :planes }
  it { is_expected.to respond_to :launch }

  describe '#land' do
    it 'lands a plane' do
      plane = double('plane')
      expect(subject.land(plane)).to eq [plane]
    end
    it 'raises an error if airport is at full capacity' do
      plane = double('plane')
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error 'Airport is full'
     end
  end

  describe '#launch' do
    it 'launches a plane' do
      plane = double('plane')
      weather = double('weather', :stormy? => false)
      subject.land(plane)
      expect(subject.launch(weather)).to eq plane
    end
    it 'raises an error if weather is stormy' do
      plane = double('plane')
      weather = double('weather', :stormy? => true)
      subject.land(plane)
      expect { subject.launch(weather) }.to raise_error 'Weather warning'
    end
  end

  describe '#planes' do
    it 'reports the planes that are in the airport' do
      plane = double('plane')
      subject.land(plane)
      expect(subject.planes).to eq [plane]
    end
  end

end
