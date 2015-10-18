require 'airplane.rb'

describe Airplane do
  describe "#landing" do
    it "responds to landing" do
      expect(subject).to respond_to :land
    end
  end

  describe "#take_off" do
    it "responds to take off" do
      expect(subject).to respond_to :take_off
    end
  end

  describe '#location status' do
    it "when flying it is not in the airport" do
      subject.flying?
      expect{subject.take_off}.to raise_error 'airplane is in flight and cannot take off'
    end
    it "when not flying and it is in the airport" do
      subject.flying? == false
      expect{subject.land}.to raise_error 'airplane is already in airport'
    end
  end
end
