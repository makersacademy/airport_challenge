require "airport"

describe Airport do
  subject(:airport) { described_class.new }

  it { is_expected.to respond_to :land }
  it "instruct a plane to land at an airport" do
    expect(airport).to respond_to :land
  end

end
