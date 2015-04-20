require 'airport'

describe Airport do
  # let(:weather) { double :weather }
  # let(:plane) { Plane.new }
  let(:plane) { Plane.new }
  context 'taking off and landing' do
    before(:each) do
      allow(subject).to receive(:storm?).and_return(false)
    end
    it 'can land a plane' do
      subject.land(plane)
      expect(subject.planes).to eql [plane]
    end

    it 'can release planes for #take_off' do
      subject.land(plane)
      subject.take_off(plane)
      expect(subject.planes).to eq []
    end
  end

  context 'traffic control' do
    before(:each) do
      allow(subject).to receive(:storm?).and_return(false)
    end
    it 'cannot allow planes to land if the airport is #full' do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport Full'
    end

    context 'weather conditions' do
      it ' cannot allow planes to take off due to a storm' do
        subject.land(plane)
        allow(subject).to receive(:storm?).and_return(true)
        expect { subject.take_off(plane) }.to raise_error
        'No Take Off Due To Storm'
      end

      it 'cannot allow planes to land due to storm' do
        allow(subject).to receive(:storm?).and_return(true)
        expect { subject.land(plane) }.to raise_error 'No Landing Due To Storm'
      end
    end
  end
end
