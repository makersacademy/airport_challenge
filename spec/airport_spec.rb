require 'airport'
require 'planes'

describe Airport do
  describe '#land' do
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end
      it 'instructs a plane to land' do
        expect(subject).to respond_to(:land)
      end
    end
    context 'when stormy' do
      it "Plane cannot land when stormy" do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.land }.to raise_error("Too stormy to land")
      end
    end
    context 'when the airport is full' do
      before do
        allow(subject).to receive(:stormy?).and_return false
      end
      it "cannot land plane as airport is full" do
        expect { subject.land }.to raise_error{"Airport is full"}
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(subject).to receive(:stormy).and_return false
      end
      it 'instructs the plane to take off' do
        expect(subject).to respond_to(:take_off)
      end
    end
    context 'when stormy' do
      it "Plane cannot take off when stormy" do
        allow(subject).to receive(:stormy).and_return true
        expect { subject.take_off }.to raise_error("Too stormy to take off")
      end
    end
  end

end
