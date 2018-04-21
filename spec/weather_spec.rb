require 'weather'

describe Weather do
  it 'can create a instance' do
    expect(Weather.new).to be_truthy
  end
  it 'has instance vairable stormy' do
    is_expected.to respond_to(:stormy)
  end

  describe '#stormy?' do
    it 'can be true or false' do
      expect(subject.stormy?).to be(true).or be(false)
    end
  end

  describe '#chance' do
    it "returns value between 0 and 10" do
      expect(subject.chance).to be_between(0, 10)
    end
  end

  describe '#stormy_decision_maker' do
    it 'should return true when chance is 2' do
      allow(subject).to receive(:chance) { 2 }
      expect(subject.stormy_decision_maker).to eq true
    end
    it 'should return false when chance is 3' do
      allow(subject).to receive(:chance) { 3 }
      expect(subject.stormy_decision_maker).to eq false
    end
  end

end
