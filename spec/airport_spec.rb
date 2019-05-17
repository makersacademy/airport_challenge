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
end