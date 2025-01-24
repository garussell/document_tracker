# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).


# Create 2 users
users = User.create!([
  { email: 'user1@example.com', password: 'password1' },
  { email: 'user2@example.com', password: 'password2' }
])

# Create 10 clients
clients = []
10.times do |i|
  clients << Client.create!(
    name: "Client #{i + 1}",
    dob: Date.new(1980 + i, rand(1..12), rand(1..28)),
    last_appointment: Date.today - rand(30..365).days,
    next_appointment: Date.today + rand(30..365).days,
    notes: "Notes for Client #{i + 1}",
    user_id: users.sample.id
  )
end

# Create 10 documents
10.times do |i|
  Document.create!(
    name: "Document #{i + 1}",
    category: ["Care Plan", "Updated Assessment", "CCAR", "NOMS"].sample,
    due_interval: [30, 60, 90, 180, 365].sample, # intervals in days
    due_date: clients.sample.last_appointment + [30, 60, 90, 180, 365].sample.days,
    client_id: clients.sample.id
  )
end

puts "Seed data created successfully!"
