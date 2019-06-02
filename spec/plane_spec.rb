require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double('airport') }

  it 'exists as a class' do
    expect(described_class).to eq(Plane)
  end
  
  it { is_expected.to respond_to(:land_at).with(1).argument }

  it 'knows it\'s landed' do 
    
  end

  # it { is_expected.to respond_to(:take_off).with(1).argument }
  
end
