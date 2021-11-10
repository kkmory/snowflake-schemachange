create function area_of_circle(radius float)
  returns float
  as
  $$
    pi() * radius * radius
  $$
  ;
