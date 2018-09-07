require 'airport'

describe Airport do
  it 'responds to land' do
    expect(subject).to respond_to :land
  end

  it 'responds to take_off' do
    expect(subject).to respond_to :take_off
  end

  it 'has landed planes' do
    expect(subject.planes?)
  end

end
