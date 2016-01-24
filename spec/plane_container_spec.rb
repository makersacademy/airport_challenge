require 'airport'

describe Airport do
  subject(:Airport) {described_class.new}
	let(:plane) { double :plane }
  let(:control) { double :control }

  # #land docks plane in airport
  # describe '#plane_in' do
  #   it 'check plane in airport' do
  #     subject.plane_in(plane)
  #     expect(subject.list_planes).to include(plane)
  #   end
  # end
  #
  # #takeoff releases plane from airport
  # describe '#plane_out' do
  #   it 'returns plane removed from airport' do
  #     subject.plane_in(plane)
  #     expect(subject.plane_out(plane)).to eq plane
  #   end
  # end
  #
  # describe '#plane_out' do
  #   it 'check plane no longer at airport' do
  #     subject.plane_in(plane)
  #     subject.plane_out(plane)
  #     expect(subject.list_planes).not_to include(plane)
  #   end
  # end

end
