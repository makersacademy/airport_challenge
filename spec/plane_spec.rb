require 'plane'

describe Plane do

  describe "respond to methods" do

    it do
      expect(subject).to respond_to(:land)
    end

    it do
      expect(subject).to respond_to(:report_landed)
    end

  end

end
