require 'weather'

describe Weather do

  it 'responds to bad weather' do
    expect(subject).to respond_to :bad
  end

  it 'responds to good weather' do
    expect(subject.good?).to be true
    subject.bad
    expect(subject.good?).to be false
  end




end
