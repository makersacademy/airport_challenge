require 'plane'

describe Plane do

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }
  it "should land" do
    expect(subject.land). to eq true
  end
end
