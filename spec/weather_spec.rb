require 'weather'

describe Weather do

  it 'Responds to the stormy? method.' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'Can return either True or False from the stormy? method.' do
    result = []
    500.times do
      result << subject.stormy?
    end
    expect(result).to include(true) and expect(result).to include(false)
  end
end
