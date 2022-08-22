Course.delete_all

30.times do
  course = Course.create!(title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote)    
    puts "Title: #{course.title}. Description: #{course.description.first(10)}..."
    puts "###"  
end
