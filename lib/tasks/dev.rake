task sample_data: :environment do
  starting = Time.now
  
  if Rails.env.development?
    Report.delete_all
    Period.delete_all
    User.delete_all
  end

  alice = User.create(
    email: "alice@example.com",
    password: "password",
    name: "Alice",
    bench_status: "on_bench"
  )

  bob = User.create(
    email: "bob@example.com",
    password: "password",
    name: "Bob",
    bench_status: "on_bench"
  )

  carol = User.create(
    email: "carol@example.com",
    password: "password",
    name: "Carol"
  )

  old_period = Period.create(
    start: DateTime.new(2021, 5, 24, 4),
    end: DateTime.new(2021, 5, 31, 4),
    current: false
  )
  
  new_period = Period.create(
    start: DateTime.new(2021, 5, 31, 4),
    end: DateTime.new(2021, 6, 7, 4),
    current: true
  )

  p "#{User.all.count} users were created."
  p "#{Period.all.count} period(s) were created."
  p "#{Report.all.count} report(s) were created."
end