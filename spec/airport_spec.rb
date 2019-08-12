require './docs/airport'
describe Airport do

  it 'can make a new airport' do
    expect(subject).to be_kind_of(Airport)
  end

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to :total_planes }

  describe '#num_of_planes' do
    it 'can check total planes' do
      expect(subject.total_planes).to eq(0)
    end
  end
  describe '#land' do
    it 'can create a new plane' do
      expect(subject.land).to be_kind_of(Plane)
    end
  end

end
