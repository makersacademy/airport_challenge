require 'airport'

describe Airport  do


    it "Confirms plane has landed" do
      expect(subject.landed?).to eq true
    end

end
