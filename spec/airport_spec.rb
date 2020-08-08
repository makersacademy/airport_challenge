require 'airport'
describe Airport do
  it 'creates an instance of Airport' do
    expect(subject).to be_instance_of Airport
  end
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  describe '#land' do
    it 'returns landed planes' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end
end