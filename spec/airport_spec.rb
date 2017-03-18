require 'airport'

describe Airport do

  describe "#land" do

    it 'responds to land' do
      expect(subject).to respond_to :land
    end

    it 'land takes 1 argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'lands a plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq true
    end
  end
end
