require 'plane'

describe Plane do

  #subject(:airport) { described_class.new }
 subject (:plane) {Plane.new}
 let(:airport) {double("airport")}

    it 'can create a plane object' do
      expect(subject).to be_an_instance_of Plane
    end
  describe "#landed" do
    it 'responds to landed' do
    expect(subject).to respond_to(:landed)
  end


  end

  describe "#storm" do
    it 'responds to weather' do
      expect(subject).to respond_to(:weather)
    end
  end
end