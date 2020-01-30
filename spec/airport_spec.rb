require 'airport'

describe Airport do
  
  let(:weather) { double :weather } 
  #subject { [1,2,3] }
  subject { Airport.new(weather) }
  describe "#initialize" do 
    it { is_expected.to respond_to(:plane_land).with(1).argument }
    it { is_expected.to respond_to(:capacity) }
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "capacity can be changed" do
    expect(subject.capacity(5)).to eq 5
    expect(subject.capacity(7)).to eq 7
  end

  let(:plane) { Airport.new(weather) }
  
  it '#raises an error when full' do
    plane.capacity
    flight = Plane.new
    allow(weather).to receive(:generate_weather).and_return("Not Storm")
    flight.stormy(weather)
    Airport::DEFAULT_CAPACITY.times do
      subject.plane_land(plane)
    end
    expect { subject.plane_land(plane) }.to raise_error('Cannot add another plane: Capacity full')
  end

  it '#plane lands and is added' do
    expect(subject.plane_land(plane)).to eq plane
  end

  it '#plane takes off and is removed' do
    subject.plane_land(plane)
    expect(subject.plane_take_off(plane)).to eq []
  end
  it '#raises an error when there are no planes at airport' do 
    expect { subject.plane_take_off(plane) }.to raise_error('No planes at airport')
  end
end
