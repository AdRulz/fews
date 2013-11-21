require 'io/console'

namespace :user do
  desc "Create new Fews user"
  task create: :environment do
    STDOUT.puts "Email:"
    email = STDIN.gets.strip
    STDOUT.puts "Password:"
    password = STDIN.noecho(&:gets)
    password = password.chomp
    STDOUT.puts "Confirm password:"
    password_confirm = STDIN.noecho(&:gets)
    password_confirm = password_confirm.chomp

    user = User.new({email:email, password: password, password_confirmation: password_confirm})

    STDOUT.puts "=>"
    if user.save
      STDOUT.puts "User successfuly created"
      STDOUT.puts "Email: #{user.email}"
      STDOUT.puts "Auth Token: #{user.token}"
    else
      STDOUT.puts "Fail!"
      user.errors.each do |field, message|
        STDOUT.puts message
      end
    end
  end
end

