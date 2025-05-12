ALTER TABLE vehicle_reservations
DROP CONSTRAINT IF EXISTS "non_overlapping_vehicle_registration";

CREATE EXTENSION IF NOT EXISTS btree_gist;

ALTER TABLE vehicle_reservations
ADD CONSTRAINT non_overlapping_vehicle_registration
EXCLUDE USING GIST (
  vehicle_id WITH =,
  TSTZRANGE(starts_at, ends_at) WITH &&
)
WHERE(NOT canceled);

SELECT conname FROM pg_constraint
WHERE contype = 'x' ;
