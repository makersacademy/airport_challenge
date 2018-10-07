# This spec tests the plane class in plain.rb
require 'plane'

describe Plane do

  describe '#Flight Status' do
    it { is_expected.to respond_to :status }

    it 'is expected to be flying by default' do
      expect(subject.status).to eq false
    end

    it 'is expected to be true when passed true arg' do
      expect(subject.status(true)).to eq true
    end
  end

end
