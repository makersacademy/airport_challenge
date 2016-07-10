### Functional Representations:

• User Story 1

    air traffic controller

    plane

    land

• User Story 2

    take_off

• User Story 3

    if stormy? prevent take_off

• User Story 4

    if stormy? prevent land

• User Story 5

    if full? prevent land

• User Story 6

    set_capacity

### Domain Model:

Controller <--- **land** ---> Plane

Controller --- **take_off** ---> Plane

Plane <--- **airbourne?** ---> true/false

Controller <-- **is_stormy?** --> true/false

Airport --> **full?** --> true/false

Controller --> **set_capacity** --> Airport
