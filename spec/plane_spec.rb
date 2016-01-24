require "plane"

  describe Plane do

    let(:airport) {double :airport}

    it "confirms status landed" do
      subject.land(airport)
      expect(subject.landed).to eq true
    end

    it "confirms status flying" do
      subject.fly
      expect(subject.landed).to eq false
    end

end
