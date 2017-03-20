require 'airport'

describe Airport do

  before do
  @plane = double('plane', :descend => @plane, :ascend => @plane, :flying? => true)
  @weather = double('weather', :stormy? => false)
  end

  describe '#land' do

    context 'when fair weather' do
      it 'tells the plane to descend' do
        subject.land(@plane, @weather)
        expect(@plane).to have_received(:descend)
      end
      it 'puts the plane in the airport' do
        expect(subject.land(@plane, @weather)).to eq [@plane]
      end
      it 'raises an error if airport is at full capacity' do
        Airport::DEFAULT_CAPACITY.times do
          plane = double('plane', :descend => plane, :flying? => true)
          subject.land(plane, @weather)
      end
      plane = double('plane', :descend => plane, :flying? => true)
      expect { subject.land(plane, @weather) }.to raise_error 'Airport is full'
     end
     it 'raises an error if this plane has already landed' do
       allow(@plane).to receive(:flying?).and_return false
       expect { subject.land(@plane, @weather)}.to raise_error 'This plane has already landed'
     end
   end

   context 'when stormy' do
     it 'raises an error if weather is stormy' do
       allow(@weather).to receive(:stormy?).and_return true
       expect { subject.land(@plane, @weather) }.to raise_error 'Weather warning'
     end
   end

  end

  describe '#launch' do
    it 'launches a plane' do
      subject.land(@plane, @weather)
      expect(subject.launch(@plane, @weather)).to eq @plane
    end
    it 'raises an error if weather is stormy' do
      subject.land(@plane, @weather)
      allow(@weather).to receive(:stormy?).and_return true
      expect { subject.launch(@plane, @weather) }.to raise_error 'Weather warning'
    end
    it 'raises an error if there are no planes' do
      expect { subject.launch(@weather) }. to raise_error 'Airport empty'
    end
    it 'tells the plane to ascend' do
      subject.land(@plane, @weather)
      subject.launch(@plane, @weather)
      expect(@plane).to have_received(:ascend)
    end
    it 'launches a specific plane' do
      plane1 = double('plane1', :descend => plane1, :ascend => plane1, :flying? => true)
      plane2 = double('plane2', :descend => plane2, :ascend => plane2, :flying? => true)
      subject.land(plane1, @weather)
      subject.land(plane2, @weather)
      expect(subject.launch(plane1, @weather)).to eq plane1
    end
    it 'raises an error if the plane is not at the airport' do
      fakeplane = double('fakeplane', :ascend => fakeplane)
      subject.land(@plane, @weather)
      expect { subject.launch(fakeplane, @weather) }.to raise_error 'That plane is not here'
    end
  end

end
