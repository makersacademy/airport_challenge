require 'plane'

describe Plane do
  it "should confirm it is landed" do
    expect(subject.landed?).to eq true
  end

  it { is_expected.to respond_to :land }

  describe "#land" do
    it "should land at an airport" do
      
    end
  end

end
