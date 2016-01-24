require 'plane'
describe Plane do

  it 'Can receive the "land" command with 1 argument.' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'Can receive the "take_off" command with 1 argument.' do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

end
