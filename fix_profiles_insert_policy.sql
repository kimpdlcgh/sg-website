
-- Step 1: Drop existing insert policy (if any)
drop policy if exists "Allow insert for new users" on profiles;

-- Step 2: Recreate the correct insert policy with proper check
create policy "Allow insert for new users"
on profiles
for insert
to public
with check (
  auth.uid() = id
);
