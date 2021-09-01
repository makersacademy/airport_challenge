require 'airport'
describe Airport do
  subject (:airport) { described_class.new }

  describe '#land' do
    it 'instructs planes to land at airport' do
      plane = Plane.new
      subject.land(plane)
      expect(plane).to eq plane
    end

    it 'confirms that airport is full' do
        20.times { airport.land(Plane.new) }
        expect { airport.land(Plane.new) }.to raise_error("Airport is full")
      end
    end

  it 'instructs planes to take off from the airport' do
    expect(subject).to respond_to :take_off
  end

end 