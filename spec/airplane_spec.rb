require 'airplane'

describe Airplane do

  context "landing" do
    it "should be able to tell when it has landed" do
      expect(subject).to be_landed
    end

  end


end
