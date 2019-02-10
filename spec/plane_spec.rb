require 'plane'
require 'airport'

describe Plane do

  let(:lear) { Plane.new }
  let(:gatwick) { Airport.new }


  it 'is actually a real Plane' do
    expect { Plane.new }.to_not raise_error
  end

  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to :take_off }

  it "knows it's landed after method call" do
    lear.land(gatwick)
    expect(lear.status).to eq("Landed.")
  end

end
