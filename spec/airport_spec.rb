require 'airport'

describe Airport do

  let(:plane) {double :plane}

  describe 'capacity' do
    it 'can be overriden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new(random_capacity)
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'land' do
    it 'can land a plane' do
      subject.land(plane)
      expect(subject.planes).to eq([plane])
    end
    it 'cannot land a plane when full' do
      random_capacity = Random.rand(10)
      subject = described_class.new(random_capacity)
      random_capacity.times{subject.land(plane)}
      expect{subject.land(plane)}.to raise_error('Airport is full, plane cannot land')
    end
  end

  # describe 'take_off' do
  #
  #   before(:each) { subject.land(plane) }
  #
  #   it 'can have a plane take off' do
  #     subject.take_off(plane)
  #     expect
  #   end
  # end

end
