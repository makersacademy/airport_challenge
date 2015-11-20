require 'airplane.rb'

describe Airplane do

  let (:airplane) {Airplane.new}

  describe "initialization" do
    it "is flying when initialized" do
      expect(subject.flying?).to eq true
    end
  end

  describe "#landing" do
    it "responds to landing" do
      expect(subject).to respond_to :land
    end

    it "should not be flying after landing" do
      airplane.land
      expect(airplane.flying?).to eq false
    end
  end

  describe "#take_off" do
    it "responds to take off" do
      expect(subject).to respond_to :take_off
    end

    it "should be flying after take off" do
      airplane.land
      airplane.take_off
      expect(airplane.flying?).to eq true
    end
  end

  describe '#location status' do
    it "when flying it is not in the airport" do
      subject.flying?
      expect{subject.take_off}.to raise_error 'airplane is in flight and cannot take off'
    end
    it "when not flying and it is in the airport" do
      subject.land
      expect{subject.land}.to raise_error 'airplane is already in airport'
    end
  end
end
