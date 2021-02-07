require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane, :status => "unassigned") }

  it { is_expected.to respond_to(:planes) }
  it { is_expected.to respond_to(:weather) }

  it "should contain no planes when new" do
    expect(airport.planes).to eq []
  end

  describe '#weather' do
    it "should return 'sunny' or 'stormy'" do
      expect(["sunny", "stormy"]).to include(airport.weather)
    end
  end

end
