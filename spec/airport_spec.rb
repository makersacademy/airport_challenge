require 'airport'

describe Airport do
  let(:mockPlane) { double :airplane }
  let(:mockAnotherPlane) { double :airplane }

  context 'when weather is clear' do
    before(:each) do
      allow(subject).to receive(:report) { :clear }
    end

    context 'when airport is not full' do
      context 'when plane is landed' do
        describe '.land' do
          it 'raises an error' do
            subject.land(mockPlane)
            expect { subject.land(mockPlane) }
              .to raise_error "Already Landed"
          end
        end

        describe '.takeoff' do
          it 'lets the plane takeoff' do
            subject.land(mockPlane)
            expect(subject.takeoff(mockPlane)).not_to include(mockPlane)
          end
        end
      end

      context 'when plane is not landed' do
        describe '.land' do
          it 'lands plane and stores' do
            expect(subject.land(mockPlane)).to include(mockPlane)
          end
        end

        describe '.takeoff' do
          it 'raises an error' do
            expect { subject.takeoff(mockPlane) }
              .to raise_error "Plane not in hangar"
          end
        end
      end
    end

    context 'when airport is full' do
      before(:each) do
        capacity = 1
        @small_airport = Airport.new(capacity)
        allow(@small_airport).to receive(:report) { :clear }
        @small_airport.land(mockPlane)
      end

      it 'prevents planes from landing' do
        expect { @small_airport.land(mockAnotherPlane) }
          .to raise_error "Airport Full"
      end
    end
  end

  context 'when weather is stormy' do
    before(:each) do
      allow(subject).to receive(:report) { :clear }
      subject.land(mockPlane)
      allow(subject).to receive(:report) { :stormy }
    end

    it 'prevents planes from landing' do
      expect { subject.land(mockAnotherPlane) }
        .to raise_error "Stormy Weather, unsafe to land"
    end

    it 'prevents planes from taking off' do
      expect { subject.takeoff(mockPlane) }
        .to raise_error "Stormy Weather, unsafe to take off"
    end
  end
end
