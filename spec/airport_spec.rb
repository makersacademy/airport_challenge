require 'airport'

describe Airport do

  let(:plane) {double :plane}

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
      subject.land(plane)
      expect(subject).not_to be_empty
    end
    it 'cannot land a plane when full' do
      subject.capacity.times{subject.land(plane)}
      expect{subject.land(plane)}.to raise_error('Airport is full, plane cannot land')
    end
  end

  describe 'take_off' do


    it 'can have a plane take off' do
      allow(plane).to receive_messages(report_landed:true)
      subject.land(plane)
      allow(plane).to receive_messages(report_take_off:true)
      subject.take_off(plane)
      expect(subject).to be_empty
    end
    it 'plane cannot take off if it isn\'t in the airport' do
      expect{subject.take_off(plane)}.to raise_error('Plane is not in Airport')
    end
  end

end
