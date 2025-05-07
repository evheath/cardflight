# Customers
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

# addresses
Address.upsert(
  {
    id: 1,
    customer_id: 1,
    primary_address: 0,
    street_address: "55 Main St",
    city: "Lincoln",
    state: "NE",
    zipcode: "68501"
  },
  unique_by: :id
)
Address.upsert(
  {
    id: 2,
    customer_id: 1,
    primary_address: 1,
    street_address: "21 Oak Ln",
    city: "Westbury",
    state: "NY",
    zipcode: "11590"
  },
  unique_by: :id
)
Address.upsert(
  {
    id: 3,
    customer_id: 3,
    primary_address: 1,
    street_address: "781 Bruce St",
    city: "Aurora",
    state: "IN",
    zipcode: "47001"
  },
  unique_by: :id
)
Address.upsert(
  {
    id: 4,
    customer_id: 4,
    primary_address: 0,
    street_address: "90 Union Ct",
    city: "Chandler",
    state: "AZ",
    zipcode: "85224"
  },
  unique_by: :id
)
Address.upsert(
  {
    id: 5,
    customer_id: 3,
    primary_address: 1,
    street_address: "3417 Briar Ave",
    city: "Kansas",
    state: "IL",
    zipcode: "61933"
  },
  unique_by: :id
)
