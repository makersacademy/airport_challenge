require 'airport'

describe Plane do
  it { expect(subject).to respond_to :flying? }
  it { expect(subject).to respond_to(:mark_as_landed) }
  it { expect(subject).to respond_to(:mark_as_flying) }

  context 'Plane can change a condition' do
    it 'is flying when taken-off' do
      subject.mark_as_flying
      expect(subject.flying?).to be_truthy
    end
    it 'is not flying when landed' do
      subject.mark_as_landed
      expect(subject.flying?).to be_falsey
    end
  end
end
