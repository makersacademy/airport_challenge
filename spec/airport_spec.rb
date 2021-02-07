require 'airport.rb'

describe Airport do
  let(:plane) { Plane.new } 

  it { is_expected.to respond_to :empty? }

  describe 'Landing' do
    it { is_expected.to respond_to :land }

    it 'Confirm airport is full if plane has landed' do
      subject.land(plane)
      expect(subject.empty?).to eq "Airport is at max capacity"
    end
  end

  describe 'Takeoff' do
    it { is_expected.to respond_to :takeoff }

    it 'Confirm space available if plane takes off' do
      subject.takeoff
      expect(subject.empty?).to eq "Airport has space available"
    end
  end
  
  context "Airport is at max capacity" do
    it 'Performs a safety check to prevent planes landing when airport is full' do
      subject.land(plane)
      expect(subject.safety_check).to eq "Capacity is full, do not land"
    end
  end

  context "Airport has space to land" do

    it 'Performs a safety check to allow planes to land when there is space for them' do
      expect(subject.safety_check).to eq "Space available, please land here"
    end
  end
end
