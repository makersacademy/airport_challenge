class Covid
  NO_ENTRY = [
    "America",
    "China",
    "Belgium",
    'South-Afrika',
    'Brazil'
  ]
  OK = [
    'Ireland'
  ]

  attr_reader :incoming_country

  def travel_ban(incoming_country)
    NO_ENTRY.include?(incoming_country)
  end

  def quarantine(incoming_country)
    !OK.include?(incoming_country)
  end

  def covid_check(incoming_country)
    ban_error if travel_ban(incoming_country)
    quarantine(incoming_country) ? quarantine_message(incoming_country) : welcome_message
  end

  def ban_error
    fail "Planes from #{incoming_country} cannot come into the UK due to Covid risk."
  end

  def quarantine_message(incoming_country)
    "Passengers from #{incoming_country} are required to quarantine upon arrival."
  end

  def welcome_message
    "Enjoy your stay!"
  end

end
