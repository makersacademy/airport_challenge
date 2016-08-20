require 'plane'

describe Plane do

  describe '#is_flying' do

    it "should turn the plane's flying status to true" do
      expect(subject.is_flying).to eq true
    end
  end

  describe '#has_landed' do
    it "should set the plane's landed status to true" do
      expect(subject.has_landed).to eq true
    end
  end


end
