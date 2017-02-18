require 'airport'

describe Airport do

it { is_expected.to respond_to :land }
it { is_expected.to respond_to :take_off }

let(:plane) { Plane.new }

  describe '#land' do
    it 'lands a plane when instructed' do
      expect(subject.land(plane)).to eq plane
    end
  end

  describe '#take_off' do
    it 'takes off a plane when instructed' do
      subject.land(plane)
      expect(subject.take_off).to eq plane
    end
  end




end
