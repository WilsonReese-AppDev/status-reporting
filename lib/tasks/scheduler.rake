desc "This task is called by the Heroku scheduler add-on"
task :create_period => :environment do
  if Time.now.monday?
    this_period = Period.current_period.update(
      current: false
    )

    new_period = Period.create(
      start: DateTime.now,
      end: 7.days.from_now,
      current: true
    )
  end
end
