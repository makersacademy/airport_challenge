class SafetyBreach

  attr_reader :threat_scale

  def initialize(threat_scale = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5, 6, 7, 8])
    @possible_threat = threat_scale.sample
  end

  def unattended_item
    @possible_threat = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 8].sample

    'Warning, unattended item spotted, safety protocol started, safety level medium.'
    safety_assesment
  end

  def drugs_on_person
    @possible_threat = [1, 1, 1, 1, 1, 1, 7].sample

    'Drugs found on a person, authorities have been notified, stay alert.'
    safety_assesment
  end

  def drugs_in_package
    @possible_threat = [1].sample

    'Drugs found in a package, authorities have been notified, stay alert.'
    safety_assesment
  end

  def weapon
    @possible_threat = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 7, 8].sample

    'weapons spotted, no planes will take off until safety restored.'
    safety_assesment
  end

  def passenger_unwell
    @possible_threat = [1].sample

    'A passenger seems unwell, care personal have been notified, safety threat low.'
    safety_assesment
  end

  def agressive_passenger
    @possible_threat = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 8].sample

    'A passenger is acting aggressive, authorities have been notified.'
    safety_assesment
  end

  def terrorist
    fail 'A terrorist threat has been made at this airport. Immediate close-down.
    Nobody is to leave until the safety level is restored. Safety level extremely dangerous.'
  end

  def safety_assesment
    case @possible_threat
    when 1
      'No safety breach.'
    when 2
      unattended_item
    when 3
      drugs_on_person
    when 4
      drugs_in_package
    when 5
      weapon
    when 6
      passenger_unwell
    when 7
      agressive_passenger
    when 8
      terrorist
    end
  end

end
