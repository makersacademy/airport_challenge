require 'spec_helper'
require 'airport'

describe Airport do
  it { is_expected.to respond_to(:order_take_off,
                                :order_landing,
                                :prevent_take_off,
                                :prevent_landing)
  }

  let(:plane) { double("plane", :take_off => true, :land => true) }

  describe "#order_take_off" do
    it "makes a plane take off" do
      expect(plane).to receive(:take_off)
      subject.order_take_off(plane)
    end

    
  end

  describe "#order_landing" do
    it "makes a plane land" do
      expect(plane).to receive(:land)
      subject.order_landing(plane)
    end

    it "adds a plane to the tarmac" do
      subject.order_landing(plane)
      expect(subject.tarmac).to eq [plane]
    end
  end

end
