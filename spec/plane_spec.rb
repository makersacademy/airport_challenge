require "plane"

describe Plane do
  subject(:plane) { described_class.new }
 let(:airport) { double :airport }

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'cannot take off flying planes' do 
      expect { plane.take_off }.to raise_error('The plane is already in the sky.')
    end
     
  end

   describe '#land' do
    it 'stores the airport the plane landed at' do 
      plane.land(airport)
      expect(plane.airport).to eq(airport)
    end

    it 'cannot land landed planes' do
      plane.land(airport)
      expect { plane.land(airport) }.to raise_error('Landed planes cannot land again.')
    end

   end

   describe '#airport' do
    it {is_expected.to respond_to(:airport)}

    it 'cannot have flying planes in the airport' do
      expect { plane.airport }.to raise_error('The plane is not at the airport.')
    end 
   end 
end
