require 'airport'

describe Plane do
  it 'responds to plane status' do
    expect(subject).to respond_to :flying?
  end
  it 'responds to plane status' do
    expect(subject).to respond_to(:mark_as_landed)
  end
  it 'responds to plane status' do
    expect(subject).to respond_to(:mark_as_flying)
  end


end
