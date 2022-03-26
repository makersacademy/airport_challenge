require_relative '../lib/airport.rb'

describe Airport do

  let(:plane)  { double  :plane }

  it "is an instance of airport" do
    expect(subject).to be_an_instance_of(Airport)
  end

  it "can receive the land command" do
    expect(subject).to respond_to(:land)
  end

  it "can store landed planes" do
    subject.land(plane)
    expect(subject.planes.size).to eq 1
  end

  it "can receive the take off command" do
    expect(subject).to respond_to(:take_off)
  end

  describe "planes taking off" do
    before do
      subject.land(plane)
    end

    it "can remove planes that have taken off from storage" do
      subject.take_off(plane)
      expect(subject.planes.size).to eq 0
    end

    it "can report when planes have taken off" do
      expect(subject.take_off(plane)).to eq "#{plane} has successfully departed."
    end
  end


end