require 'weather'

describe Weather do

it 'should respond to stormy?' do
    expect(subject).to respond_to(:stormy?)
end

it 'can be stormy' do
    expect(Weather.new.stormy?).to eq(true)
end

end