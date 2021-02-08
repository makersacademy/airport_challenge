require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane, :status => "unassigned") }

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:stormy?) }
  it { is_expected.to respond_to(:full?) }

  it "should contain no planes when new" do
    expect(airport.planes).to eq []
  end

  it "should have default capacity of 10" do
    expect(airport.capacity).to eq 10
  end

  describe '#stormy?' do
    it "should return true or false" do
      expect([true, false]).to include(airport.stormy?)
    end
  end

  describe '#full?' do
    it "should return true or false" do
      expect([true, false]).to include(airport.full?)
    end
    it 'should return true if airport is full' do
      airport.instance_variable_set(:@capacity, 1)
      airport.instance_variable_set(:@planes, [plane])
      expect(airport.full?).to eq true
      airport.instance_variable_set(:@capacity, 5)
      airport.instance_variable_set(:@planes, [plane, plane, plane, plane, plane])
      expect(airport.full?).to eq true
    end
  end

end
