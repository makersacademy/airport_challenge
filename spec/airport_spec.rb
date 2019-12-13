require 'airport'

describe Airport do
  it 'can cereate an instance of an airport' do
    ap = Airport.new
    expect(ap).to be_a Airport
  end

  it 'responds to land method' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  # it 'keeps landed planes in an array' do
  #   p1, p2 = Plane.new, Plane.new
  #   expect(planes_at_airport).to include(p1, p2)
  # end

  describe '#initialize' do
    it 'creates an instance with an empty array' do
      expect(subject.planes_at_airport).to be_a Array
    end
  end

  describe '#land' do
    let(:p) {Plane.new}
    it 'returns a plane when plane is landed' do
      expect(subject.land(p)).to eq p
    end

  end

end
