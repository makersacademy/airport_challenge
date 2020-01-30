require "plane"

describe Plane do
  subject(:plane) { described_class.new }

  describe "#take_off" do
    it { should respond_to :take_off }
  end

  it "raises error if already flying" do
    expect { plane.take_off }.to raise_error "plane already flying"
  end

  describe "#airport" do
    it { should respond_to :airport }

    it "raises error if already flying" do
        expect { plane.airport }.to raise_error "plane already flying"
      end
  end

end
