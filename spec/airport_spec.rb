describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { instance_double('Plane', land: true, take_off: false) }
  before(:each) { allow(airport).to receive(:stormy?).and_return(false) } # stub weather as good unless otherwise specified by context

  describe 'capacity' do
    subject { Airport }
    it { should respond_to(:new).with(0..1) }
  end

  def land_plane
    airport.land(plane)
  end

  describe '#land' do
    context 'when it is not full' do
      context 'when weather is good' do
        it 'should instruct the plane to land' do
          expect(plane).to receive(:land)
          land_plane
        end

        it 'should contain the plane after it has been landed' do
          land_plane
          expect(airport).to include(plane)
        end
      end

      context 'when weather is stormy' do
        before { allow(airport).to receive(:stormy?).and_return(true) }

        it 'should not instruct the plane to land' do
          expect { airport.land(plane) }.to raise_error('Weather is stormy')
        end
      end
    end

    context 'when it is full' do
      it 'should not instruct the plane to land' do
        Airport::DEFAULT_CAPACITY.times { land_plane }
        another_plane = double('Plane')
        expect { airport.land(another_plane) }.to raise_error('Airport full')
      end
    end
  end

  describe '#take_off' do
    context 'when it contains the plane' do
      before(:each) { land_plane }

      context 'when weather is good' do
        it 'should instruct the plane to take off' do
          expect(plane).to receive(:take_off)
          airport.take_off(plane)
        end

        it 'should no longer contain the plane after it has taken off' do
          airport.take_off(plane)
          expect(airport).to_not include(plane)
        end
      end

      context 'when weather is stormy' do
        before { allow(airport).to receive(:stormy?).and_return(true) }

        it 'should not instruct the plane to take off' do
          expect { airport.take_off(plane) }.to raise_error('Weather is stormy')
        end
      end
    end

    context "when it doesn't contain the plane" do
      it 'should not instruct the plane to take off' do
        expect { airport.take_off(plane) }.to raise_error('Plane not at airport')
      end
    end
  end
end
