ALTER TABLE vehicle_reservations
ADD CONSTRAINT vehicle_reservations_completed_after_created
CHECK (ends_at > starts_at);
