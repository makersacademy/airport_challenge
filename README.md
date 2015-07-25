The approach taken in this Airport Challenge notes the following:

1. If a plane is flying, then it isn't landed, and vice versa, which oviates the need for a 'landed' state.
2. Planes decide to land or to take off, not air traffic controllers (airports).
3. While (2) above is true, air traffic controllers are either allowing takes offs (or not) or allowing landing (or not), or both. Accordingly the concept of an airport 'instructing' a landing or a take-off is modelled here by planes checking whether airports state (is_allowing_take_offs or is_allowing_landing)

