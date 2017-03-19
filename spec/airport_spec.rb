require 'airport'

describe Airport do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :planes }
  it { is_expected.to respond_to :launch }

  describe '#land' do
    it 'lands a plane' do
      plane = double('plane')
      weather = double('weather', :stormy? => false)
      expect(subject.land(plane, weather)).to eq [plane]
    end
    it 'raises an error if weather is stormy' do
      plane = double('plane')
      weather = double('weather', :stormy? => true)
      expect { subject.land(plane, weather) }.to raise_error 'Weather warning'
    end
    it 'raises an error if airport is at full capacity' do
      plane = double('plane')
      weather = double('weather', :stormy? => false)
      Airport::DEFAULT_CAPACITY.times { subject.land(plane, weather) }
        expect { subject.land(plane, weather) }.to raise_error 'Airport is full'
     end
  end

  describe '#launch' do
    it 'launches a plane' do
      plane = double('plane')
      weather = double('weather', :stormy? => false)
      subject.land(plane, weather)
      expect(subject.launch(weather)).to eq plane
    end
    it 'raises an error if weather is stormy' do
      plane = double('plane')
      weather = double('weather', :stormy? => false)
      subject.land(plane, weather)
      weather = double('weather', :stormy? => true)
      expect { subject.launch(weather) }.to raise_error 'Weather warning'
    end
    it 'raises an error if there are no planes' do
      weather = double('weather', :stormy? => false)
      expect { subject.launch(weather) }. to raise_error 'Airport empty'
    end
  end

  describe '#planes' do
    it 'reports the planes that are in the airport' do
      plane = double('plane')
      weather = double('weather', :stormy? => false)
      subject.land(plane, weather)
      expect(subject.planes).to eq [plane]
    end
  end

end
