require 'plane'

describe Plane do 

    it "should create a plane" do
        expect(subject.class).to eq(Plane)
      end

      it "should set flying to false after landing" do
        expect(subject.flying).to eq true
        subject.land
        expect(subject.flying).to eq false
      end
end  