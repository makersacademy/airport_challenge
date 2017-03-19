require 'airport'

describe Airport do

  describe '#land' do
    it 'tells the plane to descend' do
      plane = double('plane', :descend => plane, :flying? => true)
      weather = double('weather', :stormy? => false)
      subject.land(plane, weather)
      expect(plane).to have_received(:descend)
    end
    it 'puts the plane in the airport' do
      plane = double('plane', :descend => plane, :flying? => true)
      weather = double('weather', :stormy? => false)
      expect(subject.land(plane, weather)).to eq [plane]
    end
    it 'raises an error if weather is stormy' do
      plane = double('plane')
      weather = double('weather', :stormy? => true)
      expect { subject.land(plane, weather) }.to raise_error 'Weather warning'
    end
    it 'raises an error if airport is at full capacity' do
      weather = double('weather', :stormy? => false)
      Airport::DEFAULT_CAPACITY.times do
        plane = double('plane', :descend => plane, :flying? => true)
        subject.land(plane, weather)
      end
      plane = double('plane', :descend => plane, :flying? => true)
      expect { subject.land(plane, weather) }.to raise_error 'Airport is full'
     end
     it 'raises an error if this plane has already landed' do
       plane = double('plane', :descend => plane, :flying? =>false)
       weather = double('weather', :stormy? => false)
       expect { subject.land(plane, weather)}.to raise_error 'This plane has already landed'
     end
  end

  describe '#launch' do
    it 'launches a plane' do
      plane = double('plane', :descend => plane, :ascend => plane, :flying? => true)
      weather = double('weather', :stormy? => false)
      subject.land(plane, weather)
      expect(subject.launch(weather)).to eq plane
    end
    it 'raises an error if weather is stormy' do
      plane = double('plane', :descend => plane, :flying? => true)
      weather = double('weather', :stormy? => false)
      subject.land(plane, weather)
      weather = double('weather', :stormy? => true)
      expect { subject.launch(weather) }.to raise_error 'Weather warning'
    end
    it 'raises an error if there are no planes' do
      weather = double('weather', :stormy? => false)
      expect { subject.launch(weather) }. to raise_error 'Airport empty'
    end
    it 'tells the plane to ascend' do
      plane = double('plane', :descend => plane, :ascend => plane, :flying? => true)
      weather = double('weather', :stormy? => false)
      subject.land(plane, weather)
      subject.launch(weather)
      expect(plane).to have_received(:ascend)
    end
  end

end
