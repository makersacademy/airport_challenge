require './spec/support/shared_examples_for_travel_record_spec'

class TravelRecordTest
  include TravelRecord
end

describe TravelRecordTest do
  it_behaves_like TravelRecord
end
