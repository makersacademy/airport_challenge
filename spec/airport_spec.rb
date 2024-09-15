require 'airport'
require 'airplane'

describe Airport do

  it { is_expected.to respond_to(:plane) }
    
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "takes off a plane and confirms if it has taken off" do
    plane_take_off = Airplane.new
    expect(subject.take_off(plane_take_off)).to eq "#{plane_take_off} has taken off"
  end

  it "prevents take-off if stormy" do
    plane = Airplane.new
    landing = subject.land(plane)
    expect(landing).to be_stormy
  end

  it "prevents landing if stormy" do
    plane = Airplane.new
    landing = subject.take_off(plane)
    expect(landing).to be_stormy
  end

  describe '#full' do
    it "prevents_landing when airport is full" do
      plane = Airplane.new
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full'
    end
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

end