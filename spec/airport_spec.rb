require "airport"
require "plane"
describe Airport do
  subject(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }
  describe '#land' do
    it 'instructing a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    context 'when full' do
        it 'Does not let plane land' do
          20.times do
            subject.land(plane)
          end
          expect { subject.land(plane) }.to raise_error 'Cannot land plane: airport full'
        end
    end
end
  describe "#take-off" do
    context "when it is stormy" do
      before do
        expect(subject).to receive(:stormy).and_return true
      end
      it 'raises an error if asked to take off a plane' do
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off plane: weather is stormy'
      end
    end
    it "letting us know plain has left airport" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
end