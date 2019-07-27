require 'spec_helper'
require 'airport'

describe Airport do
  it { is_expected.to respond_to(:order_take_off,
                                :order_landing,
                                :prevent_take_off,
                                :prevent_landing)
  }

  describe "#order_take_off" do
    it "makes a plane take off" do
      plane = double(:flying? => false)
      subject.order_take_off(plane)
      expect(plane).to be_flying
    end
  end
end
