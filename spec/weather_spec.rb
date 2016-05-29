require 'weather'

describe Weather do
  describe '#stormy?' do
    it 'returns false if weather is not stormy' do
      subject.stub(:storm_generator).and_return 1
      expect(subject.stormy?).to eq false
    end
    it 'returns true if weather is stormy' do
      subject.storm = true
      subject.stub(:storm_generator).and_return 0
      expect(subject.stormy?).to eq true
    end
  end
  describe "#storm_generator" do
    it 'returns a number 0' do
      subject.stub(:storm_generator).and_return 0
      expect(subject.storm_generator).to eq 0
    end
    it 'returns a number 1' do
      subject.stub(:storm_generator).and_return 1
      expect(subject.storm_generator).to eq 1
    end
  end
end
