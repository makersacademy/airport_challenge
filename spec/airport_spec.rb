require 'airport'
describe Airport do
  it 'Can instruct a plane to land' do
    expect(subject).to respond_to(:tell_to_land)
  end
  it 'Can instruct a plane to take off' do
    expect(subject).to respond_to(:tell_to_takeoff)
  end
  describe '#tell_to_land' do
    it 'accepts a single plane' do
      expect { subject.tell_to_land("plane") }.not_to raise_error
    end
  end
  describe '#tell_to_takeoff' do
    it 'accepts a single plane' do
      expect { subject.tell_to_takeoff("plane") }.not_to raise_error
    end
  end
end
