require 'plane'

RSpec.describe Plane do
  describe "plane initializing parameter" do
    it "provides and names a plane" do
      described_class.new(:name)
    end
  end

  describe '#spotted' do
    it "responds to method 'spotted'" do
      subject = described_class.new(:name)
      expect(subject).to respond_to :spotted
    end
  end
  describe '#prepare_take_off' do
    it "responds to method 'prepare_take_off'" do
      subject = described_class.new(:name)
      expect(subject).to respond_to :prepare_take_off
    end
  end
end
