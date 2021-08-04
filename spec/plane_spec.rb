require 'plane'

describe Plane do

  it "should initialize with an attribute" do
    expect(subject).to have_attributes(landed: false)
  end

  describe "#land method" do
    it "should change landed attrbute to true after landing" do
      subject.land
      expect(subject.landed).to eq true
    end

  end

  describe '#take_off method' do
    it "should change landed attribute to false after takeoff" do
      subject.land
      subject.take_off
      expect(subject.landed).to eq false
    end

  end

end
