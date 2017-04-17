require 'plane'


describe Plane  do


    it "Confirms plane has landed" do
      expect(subject.landed?).to eq true
    end

end
