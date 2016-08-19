require 'rails_helper'

RSpec.describe MovieController, type: :controller do

   describe "GET #index" do
	it "responds successfully with an http 200 status code" do
		get :index
		expect(response).to be_success
		expect(response).to have_http_status(200)
	end

	it "rendeers the index template" do
		get :index
		expect(response).to render_template("index")
	end

	it "load all of the movice into @movies"  do
		movie1, m2 = Movie.create!({title: "Iron Man", rating: "PG-13", total_gross: 318412101.00,  description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
    director: "Jon Favreau",
    duration: "126 min",
    image_file_name: "ironman.jpg"
  }), Movie.create!({title: "Iron Man", rating: "PG-13", total_gross: 318412101.00,  description: "Tony Stark builds an armored suit to fight the throes of evil",
    released_on: "2008-05-02",
    cast: "Robert Downey Jr., Gwyneth Paltrow and Terrence Howard",
    director: "Jon Favreau",
    duration: "126 min",
    image_file_name: "ironman.jpg"
  })
		get :index
		expect(assigns(:ms)).to match_array([movie1, m2])
	end
   end
end
