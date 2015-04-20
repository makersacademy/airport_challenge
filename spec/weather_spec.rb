require 'weather'

describe Weather do
  xit 'can be sunny' do
    expect(subject).to respond_to(:stormy?)
  end

  xit 'can be stormy' do
    expect(subject).to respond_to(:sunny?)
  end

  xit 'cannot be sunny and stormy at the same time' do
  end
end
