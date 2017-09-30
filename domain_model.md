Objects | Messages
------- | --------
plane | land
      | takeoff
      | in_air?
      | prevent_landing
      | prevent_takeoff
airport | confirm_capacity
        | update_capacity

        user => instructs => plane => land => airport
        user => instructs => plane => takeoff => airport
        user => plane => in_air?
        user => prevent_landing => plane
        user => prevent_takeoff => plane
        user => confirm_capacity => airport
        superuser => update_capacity => airport
