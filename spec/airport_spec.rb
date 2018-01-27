require 'airport'
#require 'plane'

describe Airport do

  let(:plane) { double "a plane" }

  describe "#land" do
    it "lands the planes when sunny" do
      allow(subject).to receive(:tell_weather) { "sunny" }
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe "#land" do
    it "prevent from landing when stormy" do
      allow(subject).to receive(:tell_weather) { "stormy" }
      expect(subject.land(plane)).to eq nil
    end
  end

  describe "raising error when full" do
    it 'raises error when full' do
      subject.capacity.times { subject.land plane }
      expect { subject.land plane }.to raise_error 'No free spots avaialble'
    end
  end

  describe "#take_off" do
    it "take off the planes when sunny" do
      subject.land(plane)
      allow(subject).to receive(:tell_weather) { "sunny" }
      subject.take_off(plane)
      expect(subject.planes_a).to eq []
    end
  end

  describe "#take_off" do
    it "prevent from taking off the planes when stormy" do
      allow(subject).to receive(:tell_weather) { "sunny" }
      subject.land(plane)
      allow(subject).to receive(:tell_weather) { "stormy" }
      subject.take_off(plane)
      expect(subject.planes_a).to eq [plane]
    end
  end

  describe "#confirm_take_off" do
    it "confirms that the plane took off" do
      subject.land(plane)
      allow(subject).to receive(:tell_weather) { "sunny" }
      subject.take_off(plane)
      expect(subject.confirm_take_off(plane)).to eq "#{plane} took off"
    end
  end

  describe "#confirm_take_off" do
    it "says plane didnt take off" do
      allow(subject).to receive(:tell_weather) { "sunny" }
      subject.land(plane)
      allow(subject).to receive(:tell_weather) { "stormy" }
      expect(subject.confirm_take_off(plane)).to eq "#{plane} didn't take off"
    end
  end

  describe "#random" do
    it "returns a number from 0 to 6" do
      expect(subject).to receive(:random).and_return(1)
      expect(subject.random).to eq 1
    end
  end

  describe "#tell_weather" do
    it "says it's stormy" do
      allow(subject).to receive(:random) { 1 }
      expect(subject.tell_weather).to eq "stormy"
    end
  end

  describe "#tell_wheather" do
    it "says it's sunny" do
      allow(subject).to receive(:random) { 2 }
      expect(subject.tell_weather).to eq "sunny"
    end
  end


end
