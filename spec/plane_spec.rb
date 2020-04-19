require './lib/plane.rb'

describe Plane do
  it "should be able to #land" do
    expect(subject).to respond_to :land
  end

  it { is_expected.to respond_to :take_off }
end
