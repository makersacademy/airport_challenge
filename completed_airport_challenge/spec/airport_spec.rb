require 'airport'
RSpec.describe Airport do
  describe "attr_accessors" do
    it "show attr_accessor" do
      data = described_class.new(0, 0)
      expect(data).to respond_to :airport
    end
  end
  describe "#attr_accessors" do
    it "should respond to attr_accessor; population" do
      data = described_class.new(0, 0)
      expect(data).to respond_to :population
    end
  end
  describe "#attr_accessors" do
    it "should respond to attr_accessor; capacity" do
      data = described_class.new(0, 0)
      expect(data).to respond_to :capacity
    end
  end
  describe '#airport_full' do
    context 'when population is higher than capacity' do
      it 'returns true' do
        data = described_class.new(2, 1)
        allow(data).to receive(:airport_full?) { true }
      end
      it 'returns true' do
        data = described_class.new(1, 1)
        allow(data).to receive(:airport_full?) { false }
      end
      it 'returns false' do
        data = described_class.new(1, 2)
        allow(data).to receive(:airport_full?) { false }
      end
    end
  end
end
