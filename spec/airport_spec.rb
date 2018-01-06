require 'airport'

describe Airport do
  context "Check airport capacity" do
    it 'sets capacity to default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
  context "Check airport is full" do
    it 'responds to full?' do
      expect(subject).to respond_to :full?
    end
    it "should be not full by default" do
      expect(subject).not_to be_full
    end
    it "should be full if set" do
      subject.full
      expect(subject).to be_full
    end
  end
end
