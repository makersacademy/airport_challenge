require_relative '../lib/airport'

describe Airport do 
  it { is_expected.to respond_to(:land).with(1).argument}
  it { is_expected.to respond_to(:take_off).with(1).argument}
  it { is_expected.to respond_to(:prevent_landing).with(1).argument}
  describe "aircraft landing" do 
    it 'plane can land at airport' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
  describe "aircraft take off" do
    it 'plane take off from airport' do 
      plane = Plane.new
      expect(subject.take_off(plane)).to eq 'Plane no longer in the airport' 
    end
  end
  describe "prevent landing" do 
    it "plane can't land if hangar is full" do
      plane = Plane.new
      Airport::DEFAULT_CAPACITY.times {subject.land(plane)}
      expect{subject.prevent_landing(plane)}.to raise_error "Sorry, the airport is full"
    end
  end
  describe "default capacity"
    it 'has a default capacity of 4' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  describe 'raise error' do
    it 'if default capacity exceded' do 
      Airport::DEFAULT_CAPACITY.times do
        plane = Plane.new
        subject.land(plane)
      end
      expect{subject.prevent_landing(Plane.new)}.to raise_error "Sorry, the airport is full"
    end
  end

end 