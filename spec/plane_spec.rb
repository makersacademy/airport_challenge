require 'plane'

describe Plane do

  describe "#land" do

    it 'is expected to respond to #landed with true if landed' do
      subject.land
      expect(subject.landed?).to eq true
    end

    it 'is expected to respond to #landed with false if not landed' do
      subject.landed = false
      expect(subject.landed?).to eq false
    end
end


end
