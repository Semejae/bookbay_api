class Seed 

  def self.begin
    Book.destroy_all
    Review.destroy_all
    User.destroy_all
    seed = Seed.new  
    seed.generate_dummy_users 
    seed.generate_books
    seed.generate_reviews
  end 

  def generate_dummy_users 
    user1 = User.create!(email: "lala89@beverly.com", password: "adminadmin", password_confirmation: "adminadmin",username: "lala89")
    user2 = User.create!(email: "adminadmin@admin.com", password: "adminadmin", password_confirmation: "adminadmin",username: "star69")
    user3 = User.create!(email: "pk56@pasorobleswinery.com", password: "adminadmin", password_confirmation: "adminadmin",username: "pk56")
    puts "Dummy accounts successfuly created, email: #{user1.email}, username #{user1.username} password: #{user1.password}."
    puts "Dummy accounts successfuly created, email: #{user2.email}, username #{user2.username} password: #{user2.password}."
    puts "Dummy accounts successfuly created, email: #{user3.email}, username #{user3.username} password: #{user3.password}."
  end

  def generate_books 
    50.times do |index|
      Book.create!(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, price: 19.99) 
      p "Created #{Book.count} books"
    end
  end

  def generate_reviews 

    50.times do |index|
      Review.create!(user_id: (User.ids).sample, book_id: (Book.ids).sample, content_body: Faker::Hipster.paragraph_by_chars(characters: 50, supplemental:false), rating: 1+rand(5))
      p "Created #{Review.count} books"
    end


    
    
  end 

end

Seed.begin
