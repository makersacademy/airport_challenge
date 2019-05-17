require 'airport'

describe Airport do
  let(:ap) { Airport.new }
  let(:pl) { double :plane }

  it { should respond_to(:land).with(1).argument }

   it 'should return landed planes when queried' do
    ap.land(pl)
    expect(ap.planes).to eq([pl])
   end

   it { should respond_to(:take_off).with(1).argument }

   it 'should return the requested plane from take off' do
    ap.land(pl)
    ap.land(Plane.new)
    expect(ap.take_off(pl)).to eq(pl)
   end

   it 'should no longer store the plane after take off' do
    ap.land(pl)
    ap.take_off(pl)
    expect(ap.planes).to eq([])
   end

end