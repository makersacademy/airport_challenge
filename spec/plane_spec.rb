require 'plane'

describe Plane do

  it 'responds to .flying?' do
    expect(subject).to respond_to :flying?
  end

  it 'can be flying' do
    subject.set_flying
    expect(subject.flying?).to eq true
  end

end
