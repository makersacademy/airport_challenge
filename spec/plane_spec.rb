require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double('airport') }
  let(:air) { "air" }

  it 'exists as a class' do
    expect(described_class).to eq(Plane)
  end
    
  context 'knows when' do
    it 'in the air' do 
      expect(plane.location).to eq(air)
    end
    
  end   
end
