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
      plane = double(:take_off => true)
      subject.order_take_off(plane)
      expect(subject.order_take_off(plane)).to eq plane.take_off
    end
  end

  describe "#order_landing" do
    it "makes a plane land" do
      plane = double(:land => true)
      subject.order_landing(plane)
      expect(subject.order_landing(plane)).to eq plane.land
    end
  end
end
