require 'airplane.rb'
describe Airplane do
  it 'Verify that an airplane is not at the airport after take off' do
    expect(subject).to respond_to(:on_airport)
  end
end
