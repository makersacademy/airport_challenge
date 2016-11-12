require 'airplane'

describe Airplane do

  context "sanity check" do

    it "should not be flying if it is landed" do
      expect(subject.flying?).to eq !subject.landed?
    end

  end

  context "when landing" do

    it "should be able to tell when it has landed" do
      expect(subject).to be_landed
    end

    it "should be able to land" do
      subject.land!
      expect(subject).to be_landed
    end

  end

  context "when taking off" do

    it "should be able to take off" do
      expect(subject).to respond_to(:take_off!)
    end

    it "should be able to tell when it is flying" do
      subject.take_off!
      expect(subject).to be_flying
    end

  end

  context "complex tests" do

    it "should start landed, take off and be flying, then land and be landed" do
      expect(subject).to be_landed
      subject.take_off!
      expect(subject).to be_flying
      subject.land!
      expect(subject).to be_landed
    end
    
  end

end
