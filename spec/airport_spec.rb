require 'airport'

describe Airport do

  let(:plane) {double :plane}
  let(:weather) {double :weather}

  describe 'capacity' do
    it 'has default capacity on initialize' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    it 'can be overriden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new(random_capacity)
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'land' do

    before(:each) {allow(plane).to receive_messages(report_landed:true)}

    it 'can land a plane' do
      allow(weather).to receive(:stormy?).and_return(false)
      subject.land(plane, weather)
      expect(subject).not_to be_empty
    end
    it 'cannot land a plane when full' do
      allow(weather).to receive(:stormy?).and_return(false)
      message = 'Airport is full, plane cannot land'
      subject.capacity.times{subject.land(plane, weather)}
      expect{subject.land(plane, weather)}.to raise_error message
    end
    it 'cannot land a plane when stormy' do
      allow(weather).to receive(:stormy?).and_return(true)
      message = 'Stormy weather! Cannot land!'
      expect{subject.land(plane, weather)}.to raise_error message
    end
  end

  describe 'take_off' do

    it 'can have a plane take off' do
      allow(plane).to receive_messages(report_landed:true)
      allow(weather).to receive(:stormy?).and_return(false)
      subject.land(plane, weather)
      allow(plane).to receive_messages(report_take_off:true)
      subject.take_off(plane, weather)
      expect(subject).to be_empty
    end
    it 'cannot have a plane take off if it isn\'t in the airport' do
      allow(weather).to receive(:stormy?).and_return(false)
      message = 'Plane is not in Airport'
      expect{subject.take_off(plane, weather)}.to raise_error message
    end
    it 'cannot have a plane take off if it is stormy' do
      allow(plane).to receive_messages(report_landed:true)
      allow(weather).to receive(:stormy?).and_return(false)
      subject.land(plane, weather)
      allow(plane).to receive_messages(report_take_off:true)
      allow(weather).to receive(:stormy?).and_return(true)
      message = 'Stormy weather! Cannot take off!'
      expect{subject.take_off(plane, weather)}.to raise_error message
    end
  end

end
