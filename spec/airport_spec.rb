require "airport"
require "plane"
# require "weather"

describe Airport do

  let(:plane) { Plane.new }

  context "#Initialize" do
    it "expect planes to be empty" do
      expect(subject.planes).to eq []
    end
  end

  context "#Land plane" do

    it "should allow a plane to land" do
      allow(subject).to receive(:stormy?).and_return false
      expect(subject.land(plane)).to eq [plane]
    end

    it 'raises an error when airport is stormy' do
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.land(plane) }.to raise_error "Too stormy to land"
    end

  end


  context "#Plane take off" do

    it "should allow a plane to take off and confirm take off" do
      allow(subject).to receive(:stormy?).and_return false
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "Plane take off"
    end

    it 'raises an error when airport is stormy' do
      allow(subject).to receive(:stormy?).and_return false
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.take_off(plane) }.to raise_error "Too stormy to take off"
    end

  end


  context "#Full airport" do

    it 'raises an error when airport is full' do
      Airport::DEFAULT_CAPACITY.times do
      allow(subject).to receive(:stormy?).and_return false
      subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end

  end


  context "#Airport empty" do

    it 'raises an error when airport is empty' do
      expect { subject.take_off(plane) }.to raise_error 'Airport is empty'
    end

  end


end
