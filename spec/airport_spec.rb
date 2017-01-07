require 'airport'

describe Airport do
  it { should respond_to(:take_off) }

  it 'takes off planes' do
    plane = subject.take_off
    expect(plane).to be_departed
  end
end
