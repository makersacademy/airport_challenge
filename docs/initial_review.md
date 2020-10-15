# Initial review for Airport Individual Challenge

[README file](../README.md)
[User Story 1 development documentation](dev_us1.md)

[Go to Domain Model](#domain-model-review)

[Go to Design Discussion](#design-discussion)

## Initial Challenge Review
review of challenge documentation, outline, and initial review of user stories

### Challenge presentation - Take aways:
  - challenge is focused on TDD process and evidence of this
    - ensure there is a change log showing thought and development path
  - seems more "formal" than previous challenges like the quizzes
    - ensure quality and structure is aligned to expectations
  - hard stop for submission - make sure it is delivered
  - edge case defence mentioned
    - thinking outside the core 'happy path'
    - potential PFMEA analysis to identify escape points
  - random status effects
    - good opportunity to test (and demonstrate) more advanced RSpec functionality
  - mention of 'elegant' code - potential value in codewars style solutions/ designs
  - BONUS mentioned - opportunity for extra credit -
    - end to end functionality test (testing / demonstration scenarios)

### Domain Model Review

Initial User Story review:
  - two roles identified
    - Controller and Designer
    - passengers mentioned indirectly but no later qualification
      - inconsistent reference of 'destination' with respect to passengers
        - [low risk] might need secondary role specific label for 'airport'
        - [low risk] might need to accommodate 'passenger' destinations outside of 'airport'
        - [low risk] might need to identify proximity of 'airport' to 'destination'
        - [low risk] might need route planning functionality
  - two [high confidence] objects identified, two [low confidence] objects identified
    - Airport - implied single level collection
      - passengers mentioned indirectly in association with 'airport'
      - capacity implied to be related to 'planes'
      - implied 'destination' indirectly associated with 'airport'
      - attributes: location/designator, capacity, weather
      - methods: empty? full? change_weather, override_capacity
    - Plane - implied single level collection
      - implied selection of a plane - unique identifier might be needed
      - [low risk] might need redirection functionality in the event of weather impacts
      - attributes: designator?, destination, status
      - methods: take_off, land, flying? landed?
    - [low confidence] Safety - implied ruleset
      - potential compliance check / reporting requirement
      - attributes: ruleset collection, record_of_objects, record_change_log, review_history
      - methods: report_creation, action_compliant?
    - [low confidence] Software - implied single level collection
      - potential version management, functionality, status monitoring
      - implied association with 'airport capacity'
      - attributes: designator/version, installed_airport, airport_capacity
      - methods: functional?, capacity_change

### Design discussion

Initial direction:
  - no accommodation to be made for 'potential' requirements
  - minimum code to achieve the stated user requirements and constraints
  - no extension of state diagram for potential/implied states or transitions
  - land / take_off might be applicable against the airport rather than the plane
    - interaction / state diagram to determine best placement / association
  - no external interaction outside of core "business" roles identified
    - potential roles: 'pilot', 'airline', 'travel routing agent', 'passenger', etc
  - no implicit/explicit timebase to weather or travel times
    - no explicit requirement for 'forecasting' (weather or capacity) or redirection
    - decision making done at point of action (land/take_off)
  - no implicit/explicit management of individual plane / airport passenger capacity
  - no implicit / explicit state transition requirements
    - actions are assumed to be instantaneous
