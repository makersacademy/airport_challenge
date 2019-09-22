require 'plane'

describe Plane do
  it 'exists' do
    expect(subject.class).to eq Plane
  end

  describe '#initialize' do
    it 'takes a capacity argument upon initialization' do
    expect(Airport).to respond_to(:new).with(1).argument
    end
  end
end
