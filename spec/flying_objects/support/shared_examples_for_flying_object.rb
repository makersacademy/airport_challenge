shared_examples_for FlyingObject do
  let(:subject) { described_class.new }

  it 'can be created' do
    expect(described_class.new).to be_kind_of(described_class)
  end

  describe '#land' do
    it 'can respond to land' do
      expect(subject).to respond_to(:land)
    end

    it 'can change the flying status' do
      subject.land

      expect(subject.flying?).to eq(false)
    end

    it 'will stay the same if already not flying' do
      my_ground_subject = described_class.new(false)

      my_ground_subject.land

      expect(my_ground_subject.flying?).to eq(false)
    end
  end

  describe '#flying?' do
    it 'can respond to flying' do
      expect(subject).to respond_to(:flying?)
    end
  end
end
