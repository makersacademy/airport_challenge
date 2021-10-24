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
    it "letting us know plain has left airport" do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end
end