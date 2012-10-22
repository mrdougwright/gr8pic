desc "This task is called by the Heroku scheduler add-on"

task :update_history_db => :environment do
  puts "Updating table..."
  NewsFeed.update
  puts "done."
end

# task :send_reminders => :environment do
#   User.send_reminders
# end

#Trying to create scheduler for daily history of highest rated photo.