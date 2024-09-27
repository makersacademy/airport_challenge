require 'weather'

describe Weather do
  it 'respond to stormy?' do
    expect(subject).to respond_to :stormy?
  end
end
