require 'airport'
require 'weather'
require 'plane'

describe Airport do

  it "Allows the user to create an instance of Airport" do
    expect(subject).to be_an_instance_of(Airport)
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "#initialize" do
    #it "has a variable capacity" do
      #airport = Airport.new(10)
      #10.times { airport.land Plane.new }
      #expect{ airport.land Plane.new }.to raise_error 'Airport Full'
    subject { Airport.new }
    let(:plane) { Plane.new }
    #plane = Plane.new
    it "allows user to set capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{ subject.land(plane) }.to raise_error 'Airport Full'
    end
  end

  describe "#land" do
    it 'responds to #land with one argument' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'raises an error when full' do
      # 10.times { subject.land Plane.new } ## Refactor this as below
      # Airport::DEFAULT_CAPACITY.times do  ## Refactor again as below
      #   subject.land Plane.new
      # end
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport Full'
    end
  end

  describe "#take_off" do
    it 'responds to #take_off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
    it 'prevents take off if stormy(number 1)' do
      allow(subject).to receive(:weather) { 1 }
      expect { subject.take_off Plane.new }.to raise_error 'Cant take off in stormy weather'
    end
    it 'allows take off if sunny (number 2-6)' do
      subject.land(Plane.new)
      allow(subject).to receive(:weather) { 3 }
      expect { subject.take_off(Plane.new) }.to change { subject.plane.length }.by(-1)
    end
  end

end
