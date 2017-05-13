require "plane.rb"

describe Plane do
  "it should be able to confirm that it has landed" do
    it { is_expected.to respond_to :confirm_land }
  end
end
