-- Update the status column to only allow 'available' and 'sold' values
-- and set the default to 'available'
DO $$
BEGIN
    -- First update any existing 'draft' status to 'available'
    UPDATE products SET status = 'available' WHERE status = 'draft' OR status IS NULL;
    
    -- Then alter the column to add the constraint
    ALTER TABLE products 
      ALTER COLUMN status SET DEFAULT 'available',
      ADD CONSTRAINT valid_status 
      CHECK (status IN ('available', 'sold'));
      
    RAISE NOTICE 'Updated products table with status constraints';
EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error updating products table: %', SQLERRM;
END
$$;
