# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# ["f_name", "l_name", "email", "password", "password_confirmation", "agency"]



# CaseWorkers

cw1 = Caseworker.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, email: "caseworker@gmail.com", password:"password1", password_confirmation:"password1", agency:"The Door")
cw2 = Caseworker.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, email: FFaker::Internet.email, password:"password2", password_confirmation:"password2", agency:"The Door")
cw3 = Caseworker.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, email: FFaker::Internet.email, password:"password3", password_confirmation:"password3", agency:"Bowery Mission")
cw4 = Caseworker.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, email: FFaker::Internet.email, password:"password4", password_confirmation:"password4", agency:"Bowery Mission")


# Donors

donor1 = Donor.create(f_name:FFaker::Name.first_name, l_name:FFaker::Name.last_name, email:"donor@gmail.com", password:"password1", password_confirmation:"password1", funds_remaining:100.00, funds_spent:20.25)
donor2 = Donor.create(f_name:FFaker::Name.first_name, l_name:FFaker::Name.last_name, email:FFaker::Internet.email, password:"password2", password_confirmation:"password2", funds_remaining:195.00, funds_spent:5.00)
donor3 = Donor.create(f_name:FFaker::Name.first_name, l_name:FFaker::Name.last_name, email:FFaker::Internet.email, password:"password3", password_confirmation:"password3", funds_remaining:75.25)
donor4 = Donor.create(f_name:FFaker::Name.first_name, l_name:FFaker::Name.last_name, email:FFaker::Internet.email, password:"password4", password_confirmation:"password4", funds_remaining:20.00)
donor5 = Donor.create(f_name:FFaker::Name.first_name, l_name:FFaker::Name.last_name, email:FFaker::Internet.email, password:"password5", password_confirmation:"password5", funds_remaining:29.00)
donor6 = Donor.create(f_name:FFaker::Name.first_name, l_name:FFaker::Name.last_name, email:FFaker::Internet.email, password:"password6", password_confirmation:"password6", funds_remaining:40.00)
donor7 = Donor.create(f_name:FFaker::Name.first_name, l_name:FFaker::Name.last_name, email:FFaker::Internet.email, password:"password7", password_confirmation:"password7", funds_remaining:50.00)

# Clients

client1 = Client.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, gender: 'Male', client_alias: FFaker::Name.name, about: FFaker::HealthcareIpsum.paragraphs.join("\n\n"), zip: FFaker::AddressUS.zip_code, caseworker: cw1)
client2 = Client.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, gender: 'Male', client_alias: FFaker::Name.name, about: FFaker::HealthcareIpsum.paragraphs.join("\n\n"), zip: FFaker::AddressUS.zip_code, caseworker: cw1)
client3 = Client.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, gender: 'Male', client_alias: FFaker::Name.name, about: FFaker::HealthcareIpsum.paragraphs.join("\n\n"), zip: FFaker::AddressUS.zip_code, caseworker: cw1)
client4 = Client.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, gender: 'Male', client_alias: FFaker::Name.name, about: FFaker::HealthcareIpsum.paragraphs.join("\n\n"), zip: FFaker::AddressUS.zip_code, caseworker: cw2)
client5 = Client.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, gender: 'Male', client_alias: FFaker::Name.name, about: FFaker::HealthcareIpsum.paragraphs.join("\n\n"), zip: FFaker::AddressUS.zip_code, caseworker: cw2)
client6 = Client.create(f_name: FFaker::Name.first_name, l_name: FFaker::Name.last_name, gender: 'Male', client_alias: FFaker::Name.name, about: FFaker::HealthcareIpsum.paragraphs.join("\n\n"), zip: FFaker::AddressUS.zip_code, caseworker: cw3)

# Goals

c1g1 = client1.goals.create(card_type:'monthly', card_start_date: '2015.9.1', cost:116.50, status: 'open')
c1g2 = client1.goals.create(card_type:'monthly', card_start_date: '2015.10.1', cost:116.50, status: 'open')
c1g3 = client1.goals.create(card_type:'weekly', card_start_date: '2015.11.1', cost:31.00, status: 'open')

c2g1 = client2.goals.create(card_type:'monthly', card_start_date: '2015.10.15', cost:116.50, status: 'open')
c2g2 = client2.goals.create(card_type:'monthly', card_start_date: '2015.11.15', cost:116.50, status: 'open')

c3g1 = client3.goals.create(card_type:'weekly', card_start_date: '2015.9.15', cost:31.00, status: 'open')

# Destinations

c1d1 = client1.destinations.create(destination: "Doctor")
c1d2 = client1.destinations.create(destination: "Work")
c1d3 = client1.destinations.create(destination: "School")
c1d4 = client1.destinations.create(destination: "AA")

c2d1 = client2.destinations.create(destination: "Case Worker")
c2d2 = client2.destinations.create(destination: "Physical Therapy")
c2d3 = client2.destinations.create(destination: "Work")

# Donations

Donation.create(donor: donor1, client: client1, goal:c1g1, amount: 10.00)
Donation.create(donor: donor1, client: client1, goal:c1g2, amount: 4.25)
Donation.create(donor: donor1, client: client3, goal:c3g1, amount: 6.00)
Donation.create(donor: donor2, client: client1, goal:c1g1, amount: 5.00)
