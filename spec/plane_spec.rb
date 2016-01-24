require 'plane'

describe Plane do

  describe "land" do

    it "can land a plane" do
      subject.land
      expect(subject.landed).to eq true
    end

    it "won't let a plane land if it's already landed" do
      subject.land
      expect{subject.land}.to raise_error "This plane has already landed"
    end
  end

  describe "take off" do

    before (:each) do
      subject.land
    end

     it "can take off a plane" do
       subject.take_off
       expect(subject.landed).to eq false
     end

     it "won't let a departed plane take off again" do
       subject.take_off
       expect{subject.take_off}.to raise_error "This plane has already left"
     end


  end



end
