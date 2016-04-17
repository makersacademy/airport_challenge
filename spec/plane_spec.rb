require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe '#initialize' do
    it 'creates a plane with a default status: landed' do
      expect(subject.landed).to eq(true)
    end
  end

  it 'can change its status to landed' do
    subject.land
    expect(subject.landed).to eq true
  end
  it 'can change its status to airborne' do
    subject.take_off
    expect(subject.landed).to eq false
  end
end
