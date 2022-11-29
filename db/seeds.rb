states = ["Kuala Lumpur", "Penang", "Selangor", "Johor", "Sarawak", "Sabah", "Melaka", "Perak"] 


10.times do |n|

    n == 0 ? admin_flag = true : admin_flag = false
  
    User.create(
        email: "test#{n+1}@gmail.com",
        password: "123456",
        locality: states.sample,
        is_admin: admin_flag,
        english_name: Faker::Name.first_name,
        chinese_name: Faker::Name.last_name,
    )

    Event.create(
        title: Faker::Hobby.activity,
        start_date: Faker::Date.forward(days: 1),
        end_date: Faker::Date.forward(days: 10),
        start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
        end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

50.times do |n|
    Participant.create(
        english_name: Faker::Name.first_name,
        chinese_name: Faker::Name.last_name,
        gender: ["Brother", "Sister"].sample ,
        language: "English",
        academic_year: Faker::Number.between(from: 1, to: 4),
        email: Faker::Internet.email,
        phone: Faker::Number.number(digits: 12),
        remarks: Faker::Quote.yoda,
        college: Faker::University.name,
        locality: states.sample
    )
end


200.times do |n|
    suppress(Exception) do
        Appointment.create(
            participant_id: Faker::Number.between(from: 1, to: 50), 
            event_id: Faker::Number.between(from: 1, to: 10),
            user_id: Faker::Number.between(from: 1, to: 10),
        )
    end     
end
