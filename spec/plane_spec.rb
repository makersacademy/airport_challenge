require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  # context '#land' do
  #
  #   it { is_expected.to respond_to :land }
  #   it 'checks if plane has landed' do
  #     expect(plane.land).to eq 'The plane has landed'
  #
  #   end
  #end

  context '#take_off' do

    it { is_expected.to respond_to :take_off }
    it 'checks if plane has taken off' do
      expect(plane.take_off).to eq 'The plane has taken off'

    end
  end

end
