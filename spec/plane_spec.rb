require 'plane'

describe Plane do
  describe "#status" do
    it 'new plane has status of flying set to true' do
      expect(Plane.new.flying?).to eq(true)
    end
  end

  describe "#change_status" do
    it 'changes flying from true to false' do
      subject.change_status
      expect(subject.flying?).to eq(false)
    end
    it 'changes flying from false to true' do
      subject.change_status
      subject.change_status
      expect(subject.flying?).to eq(true)
    end
  end
end
