require "plane"

describe Plane do
  subject(:plane) { described_class.new }

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'cannot take off flying planes' do 
      expect { plane.take_off }.to raise_error('The plane is in the sky.')
    end
  end

   describe '#airport' do
    it {is_expected.to respond_to(:airport)}

    it 'cannot have flying planes in the airport' do
      expect { plane.airport }.to raise_error('The plane is in the sky.')
    end 
   end 
end
