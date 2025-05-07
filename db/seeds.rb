
# upsert customers
Time.use_zone("Central Time (US & Canada)") do
  Customer.upsert(
    {
      id: 1,
      first_name: "Sam",
      last_name: "Smith",
      active: 1,
      created_at: Time.new(2024, 1, 1, 23, 44, 51)
    },
    unique_by: :id
  )
  Customer.upsert(
    {
      id: 2,
      first_name: "Jane",
      last_name: "Thomas",
      active: 0,
      created_at: Time.new(2024, 3, 10, 11, 21, 43)
    },
    unique_by: :id
  )
  Customer.upsert(
    {
      id: 3,
      first_name: "Larry",
      last_name: "Jones",
      active: 1,
      created_at: Time.new(2024, 7, 16, 14, 21, 35)
    },
    unique_by: :id
  )
  Customer.upsert(
    {
      id: 4,
      first_name: "Laura",
      last_name: "Miller",
      active: 1,
      created_at: Time.new(2025, 1, 15, 12, 34, 56)
    },
    unique_by: :id
  )
end
