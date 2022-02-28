require 'airplane'
describe 'airplane tests' do
  let(:airplane) {AirPlane.new}
  it 'test set_status_as_landed works' do
    airplane.set_status_as_flying
    airplane.set_status_as_landed
    expect(airplane.flying).to eq false
  end

  it 'test set_status_as_flying works' do
    airplane.set_status_as_landed
    airplane.set_status_as_flying
    expect(airplane.flying).to eq true
  end
end