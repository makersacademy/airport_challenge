require 'airport'

describe Airport do
  let(:plane) { double("plane") }

  it { is_expected.to respond_to(:empty?) }
  it { is_expected.to be_empty }
  it { is_expected.to respond_to(:full?) }
  it { is_expected.to respond_to(:receive).with(1).argument }

  it 'can accept a custom capacity' do
    expect(Airport.new(13).capacity).to eq(13)
  end

  describe '#receive' do
    context 'if not full' do
      it 'accepts a plane' do
        subject.receive(plane)
        expect(subject.hangar[0]).to eq(plane)
      end

      it 'gets full when capacity is reached' do
        subject.capacity.times { subject.receive(plane) }
        expect(subject).to be_full
      end
    end

    context 'if full' do
      before do
        subject.receive(plane)
      end
      it 'raises an error if a plane tries to land' do    
        expect{ subject.receive(plane) }.to raise_error("Sorry, Hangar Full")
      end
    end
  end
end
