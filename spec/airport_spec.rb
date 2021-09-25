require 'airport'

describe Airport do
  it 'responds to the method empty?' do
    expect(subject).to respond_to(:empty?)
  end
end
