describe Plane do
  let(:plane) { described_class.new }

  describe '#land' do
    context 'when flying' do
      it 'should land' do
        expect(plane).to receive(:land).and_return(true)
        plane.land
      end
    end

    context 'when landed' do
      it 'should not land again' do
        plane.land
        expect { plane.land }.to raise_error('Plane already landed')
      end
    end
  end

  describe '#take_off' do

    context 'when landed' do
      it 'should take off' do
        expect(plane).to receive(:take_off).and_return(false)
        plane.take_off
      end
    end

    context 'when flying' do
      it 'should not take off again' do
        plane.take_off
        expect { plane.take_off }.to raise_error('Plane already flying')
      end
    end
  end
end
