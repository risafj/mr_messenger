(1..5).each do |n|
    Message.create(
      scheduled_date_time: '2019-01-10 22:00:00',
      sender_number: '+16463629168',
      receiver_number: '+818053800431',
      content: "silly goose #{n}"
    )
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?