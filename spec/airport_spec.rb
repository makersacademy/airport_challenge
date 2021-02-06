require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double(:plane, :status => "unassigned") }

  it { is_expected.to respond_to(:planes) }

  it "should contain no planes when new" do
    expect(airport.planes).to eq []
  end

end
