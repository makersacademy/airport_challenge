require 'plane'

describe Plane do

  it 'responds to .flying?' do
    expect(subject).to respond_to :flying?
  end

  it 'can be flying' do
    subject.flying=(true)
    expect(subject.flying?).to eq true
  end

end
