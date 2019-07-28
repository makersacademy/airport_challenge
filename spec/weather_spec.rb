require 'weather'
describe Weather do
  it {expect(Weather.new).to respond_to(:storm)}
  it {expect(Weather.new).to respond_to(:sunny)}
end