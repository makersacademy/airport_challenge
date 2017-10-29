require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  let(:plane) { double :plane }

  before(:example) do
    airport.stormy = false
    allow(plane).to receive(:landed) { false }
    allow(plane).to receive(:change_status)
  end

  describe 'attributes' do

    it "verify if :planes return an array" do
      expect(airport.planes).to be_an_instance_of(Array)
    end

    it "allows reading and writing for :stormy" do
      airport.stormy = true
      expect(airport.stormy).to eq(true)
    end

    it ":capacity have a default value 10" do
      expect(airport.capacity).to eq(10)
    end

    it "allows reading and writing for :capacity" do
      airport.capacity = 100
      expect(airport.capacity).to eq(100)
    end

  end

  describe '#land' do

    it { expect(airport).to respond_to(:land).with(1).argument }

    it "raise error if plane landed in another airport already" do
      allow(plane).to receive(:landed) { true }
      expect { airport.land(plane) }.to raise_error("plane already landed")
    end

    it "check if the plane in the airport after landing" do
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end

  end

  describe '#take_off' do

    it { expect(airport).to respond_to(:take_off).with(1).argument }

    it "remove plane from airport after take_off" do
      airport.land(plane)
      allow(plane).to receive(:landed) { true }
      airport.take_off(plane)
      expect(airport.planes).to be_empty
    end

    it "raise error if the plane took off already" do
      expect { airport.take_off(plane) }.to raise_error("plane already took off ")
    end

    it "raise error if you take_off a plane that landed in another airport" do
      allow(plane).to receive(:landed) { true }
      expect { airport.take_off(plane) }.to raise_error("this plane is not landed in this airport")
    end

  end

  context 'stormy' do

    it "raise error when you want to take off in stormy weather" do
      airport.land(plane)
      airport.stormy = true
      allow(plane).to receive(:landed) { true }
      expect { airport.take_off(plane) }.to raise_error("you can t take_off it s stormy")
    end

    it "prevent landing when weather is stormy" do
      airport.stormy = true
      expect { airport.land(plane) }.to raise_error("you can t land it s stormy")
    end

  end

  context 'airport is full' do

    it "raise error when landing and the airport is full" do
      airport.capacity.times { airport.land(plane) }
      expect { airport.land(plane) }.to raise_error("airport is full!")
    end

  end

end
