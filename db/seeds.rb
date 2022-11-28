states = ["Kuala Lumpur", "Penang", "Selangor", "Johor", "Sarawak", "Sabah", "Melaka", "Perak"] 



20.times do |n|

    if n == 0
        admin_flag = true
    else
        admin_flag = false
    end

    User.create(
        email: "test#{n+1}@gmail.com",
        password: "123456",
        is_admin: admin_flag
    )

end