require 'rails_helper'

RSpec.describe Movie, type: :model do
#  pending "add some examples to (or delete) #{__FILE__}"

movie_attributes = {title: 'ABC', rating: 'R', total_gross: 2894.8, description: "2" * 25, released_on: Time.now, cast: "ABC", director: "ABC", duration: "1hous", image_file_name: ""}

   it "is valid with valid attributes bbb" do 
       expect(Movie.new(movie_attributes)).to be_valid
   end

  it "is not valid without a title" do
     movie = Movie.new(title: "")
     movie.valid? 
     expect(movie.errors[:title].any?).to eq(true)
  end
  it "is not valid without a description" do 
     movie = Movie.new(description: "")
     movie.valid?
     expect(movie.errors[:description].any?).to eq(true)
  end
  it "is not valid without a released_on" do
     movie = Movie.new(released_on: "")
     movie.valid?
     expect(movie.errors[:released_on].any?).to eq(true)
  end 
  it "is not valid without a duration" do
     movie = Movie.new(duration:"")
     movie.valid?
     expect(movie.errors[:duration].any?).to eq(true)
  end
  it "description requries over 24 characters" do
	movie = Movie.new(description: "B" * 24)
	movie.valid?
	expect(movie.errors[:description].any?).to eq(true)
  end
  it "total_gross can be 0" do
	movie = Movie.new(total_gross: 0.00)
	movie.valid?
	expect(movie.errors[:total_gross].any?).to eq(false)
  end
  it "accepts a positive total_gross" do
	movie = Movie.new(total_gross: 10000000.00)
	movie.valid?
	expect(movie.errors[:total_gross].any?).to eq(false)
  end
  it "rejects a negative total gross" do
    movie = Movie.new(total_gross: -10000000.00)

    movie.valid?

    expect(movie.errors[:total_gross].any?).to eq(true)
  end
  it "is a flop if the total gross is less then $50M" do
	movie = Movie.new(total_gross: 40000000.00)
	expect(movie.flop?).to eq(true)
  end
  it "is not a flop if the total gross exceeds $50M" do 
	movie = Movie.new(total_gross: 60000000.00)
	expect(movie.flop?).to eq(false)
  end
  it "accept properly formatted image file names" do
	file_names = %w[e.png movie.png movie.jpg movie.gif MOVIE.GIF]
	file_names.each do |file_name|
		movie = Movie.new(image_file_name: file_name)
      		movie.valid?
      		expect(movie.errors[:image_file_name].any?).to eq(false)
        end
  end
  it "rejects improperly formatted image file names" do
    file_names = %w[movie .jpg .png .gif movie.pdf movie.doc]
    file_names.each do |file_name|
      movie = Movie.new(image_file_name: file_name)
      movie.valid?
      expect(movie.errors[:image_file_name].any?).to eq(true)
    end
  end
  it "accepts any rating that is in an approved list 1" do
	rattings = %w(G PG PG-13 R NC-17)
	rattings.each do |rating|
		movie = Movie.new(rating: rating)
		movie.valid?
		expect(movie.errors[:rating].any?).to eq(false)
        end
  end
  it "rejects any rating that is not in an approved list 2" do
    ratings = %w(R-13 R-16 R-18 R-21)
    ratings.each do |rating|
      movie = Movie.new(rating: rating)
      movie.valid?
      expect(movie.errors[:rating].any?).to eq(true)
    end
  end
   it "is valid with example attributes"  do 
	movie = Movie.new(movie_attributes)
       
	expect(movie.valid?).to eq(true)
   end
end

