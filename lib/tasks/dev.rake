task sample_data: :environment do
  starting = Time.now
  
  if Rails.env.development?
    User.delete_all
  end

  people = Array.new(7) do
    {
      name: Faker::Name.first_name,
    }
  end

  people << { name: "Alice" }
  people << { name: "Bob" }
  people << { name: "Carol" }

  people.each do |person|
    username = person.fetch(:name).downcase

    user = User.create(
      email: "#{username}@example.com",
      password: "password",
      name: "#{person[:name]}",
    )
  end
  p "#{User.all.count} users were created."
end