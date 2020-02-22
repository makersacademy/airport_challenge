require 'airport'
shared_context "common" do
  let(:plane) { Plane.new }
end
describe Airport do
  include_context "common"
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:take_off) }

  describe '#initialize' do
    it "new airport capacity defaults to 10" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#land' do
    it 'lands a plane' do
      expect(subject.land(plane)[-1]).to eq plane
    end

    it "raises an error if airport is full" do
      Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error "No spaces are available for landing"
    end

    it 'fails when you try to land same plane' do
    end
  end

  describe '#take_off' do
    it 'gets take off message' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "Plane took off"
    end

    it 'raises an error if there are no planes to take off' do
      expect { subject.take_off(plane) }.to raise_error "There are no planes to take off"
    end
  end
  
  
end
