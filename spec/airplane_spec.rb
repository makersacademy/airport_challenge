require 'airplane'

describe Airplane do

  let(:weather) { double(:weather, condition: "Sunny") }

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
      subject.land!(weather)
      expect(subject).to be_landed
    end

  end

  context "when taking off" do

    it "should be able to take off" do
      expect(subject).to respond_to(:take_off!)
    end

    it "should be able to tell when it is flying" do
      subject.take_off!(weather)
      expect(subject).to be_flying
    end

  end

  context "complex tests" do

    it "should start landed, take off and be flying, then land and be landed" do
      expect(subject).to be_landed
      subject.take_off!(weather)
      expect(subject).to be_flying
      subject.land!(weather)
      expect(subject).to be_landed
    end

  end

  context "bad weather tests" do
    let(:bad_weather) { double(:weather, :condition => "Stormy" )}

    it "should not take off in bad weather" do
      subject.take_off!(bad_weather)
      expect(subject).to be_landed
    end

    it "should not land in bad weather" do
      subject.take_off!(weather)
      subject.land!(bad_weather)
      expect(subject).to be_flying
    end
  end

end
