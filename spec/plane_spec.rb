require 'plane'

RSpec.describe Plane do
  it "provides a plane" do
    Plane.new
  end
  describe '#air_traffic' do
    it "notifies new plane in air" do
      expect(subject.air_traffic).to eq("#{@plane} spotted in the air. Notified Air Traffic Control.")
    end
  end
end
