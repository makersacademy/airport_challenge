require "airport"

describe Airport do
  describe "#land" do
    it 'returns "plane landed" when a plane is landed' do
      plane = Plane.new
      expect(subject.land(plane)).to eq("plane landed")
    end
  end

  describe "#take_off" do
    it 'returns "plane took off" when a plane takes off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq("plane took off")
    end
  end
end