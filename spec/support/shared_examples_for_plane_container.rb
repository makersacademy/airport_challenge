shared_examples_for PlaneContainer do

# describe PlaneContainerTest do
  subject(:PlaneContainer) {described_class.new}
	let(:plane) { double :plane }
  # let(:control) { double :control }

  #responds to methods in module
  it { is_expected.to respond_to(:plane_in).with(1).argument }
  it { is_expected.to respond_to(:plane_out).with(1).argument }

  #logged into module list
  describe '#plane_in' do
    it 'check plane into list' do
      subject.plane_in(plane)
      expect(subject.list_planes).to include(plane)
    end
  end

  describe '#plane_in' do
    it 'check plane added to list' do
      expect { subject.plane_in(plane) }.to change{ subject.list_planes.count }.from(0).to(1)
    end
  end

  #logged out of module list
  describe '#plane_out' do
    it 'returns plane removed from list' do
      subject.plane_in(plane)
      expect(subject.plane_out(plane)).to eq plane
    end
  end

  describe '#plane_out' do
    it 'check plane no longer in list' do
      subject.plane_in(plane)
      subject.plane_out(plane)
      expect(subject.list_planes).not_to include(plane)
    end
  end

  describe '#plane_out' do
    it 'check plane deleted from list' do
      subject.plane_in(plane)
      expect { subject.plane_out(plane) }.to change{ subject.list_planes.count }.from(1).to(0)
    end
  end

  # describe 'list_planes' do
  #   it 'list contains planes' do
  #     subject.plane_in(plane)
  #     expect(subject.list_planes.last).to be_an_instance_of Airplane
  #   end
  # end

  describe '#initialize' do
    it 'has a default capacity when initialized' do
      expect(subject.capacity).to eq subject.class::DEFAULT_CAPACITY
    end
  end

  describe '#initialize' do
    it 'has a set capacity when initialized' do
      random = rand(subject.class::DEFAULT_CAPACITY)
      subject = described_class.new(random)
      expect(subject.capacity).to eq random
    end
  end

  #is full at capacity
  describe 'full?' do
    it 'reaches full at capacity' do
      subject.capacity.times { subject.plane_in(plane) }
      expect(subject.full?).to be true
    end
  end

end
