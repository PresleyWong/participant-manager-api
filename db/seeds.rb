states = ["Johor", "Kedah", "Kelantan", "Kuala Lumpur", "Labuan", "Malacca", "Negeri Sembilan", "Pahang", "Penang", "Perak", "Perlis", "Putrajaya", "Sabah", "Sarawak", "Selangor", "Terengganu"] 


25.times do |n|

    n == 0 ? admin_flag = true : admin_flag = false
  
    User.create(
        email: "test#{n+1}@gmail.com",
        password: "123456",
        locality: states.sample,
        is_admin: admin_flag,
        name: Faker::Name.first_name,
    )

    Event.create(
        title: Faker::Hobby.activity,
        start_date: Faker::Date.forward(days: 1),
        end_date: Faker::Date.forward(days: 10),
        start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
        end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
    )
end

100.times do |n|
    Participant.create(
        english_name: Faker::Name.first_name,
        chinese_name: Faker::Name.last_name,
        gender: ["Brother", "Sister"].sample ,
        language: ["English", "Chinese"].sample,
        academic_year: Faker::Number.between(from: 1, to: 4),
        email: Faker::Internet.email,
        phone: Faker::Number.number(digits: 12),
        remarks: Faker::Lorem.sentence(word_count: 3),
        college: Faker::University.name,
        locality: states.sample
    )
end


400.times do |n|
    suppress(Exception) do
        Appointment.create(
            participant_id: Faker::Number.between(from: 1, to: 100), 
            event_id: Faker::Number.between(from: 1, to: 25),
            user_id: Faker::Number.between(from: 1, to: 25),
        )
    end     
end
