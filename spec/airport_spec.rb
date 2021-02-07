require 'airport.rb'

describe Airport do
  let(:plane) { Plane.new } 

  it { is_expected.to respond_to :empty? }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'allows user to change capacity' do
    expect(subject.change_capacity(50)).to eq "Capacity changed to 50"
  end

  describe 'Landing' do
    it { is_expected.to respond_to :land }

    it 'Confirm airport is full if plane has landed' do
      subject.land(plane)
      expect(subject.empty?).to eq "Airport contains plane"
    end
  end

  describe 'Takeoff' do
    it { is_expected.to respond_to :takeoff }

    it 'Confirm space available if plane takes off' do
      subject.takeoff
      expect(subject.empty?).to eq "Airport is empty"
    end
  end
  
  context "Airport at max capacity" do
    it 'Performs a safety check to prevent planes landing when airport is full' do
      20.times { subject.land(plane) }
      expect(subject.safety_check).to eq "Capacity is full, do not land"
    end
  end

  context "Airport has space to land" do
    it 'Performs a safety check to allow planes to land when there is space for them' do
      expect(subject.safety_check).to eq "Space available, please land here"
    end
  end

  context 'Stormy weather' do
    it 'Prevents takeoff when weather is stormy' do
      expect(subject.check_weather("stormy")).to eq "Weather is stormy, do not takeoff"
    end

    it 'Prevents landing when weather is stormy' do
      expect(subject.check_weather("stormy")).to eq "Weather is stormy, do not land"
    end
  end
end
