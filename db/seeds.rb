Course.delete_all
User.delete_all

puts "##### Users #####"
10.times do 
  user = User.create!(
    email: Faker::Internet.email,
    password: 'default')    
    puts "User #{user.email} created"      
end

puts "##### Courses #####"
10.times do
  course = Course.create!(
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user_id: User.last.id)    
    puts "Title: #{course.title}. Description: #{course.description}... "
    puts "###"
end
