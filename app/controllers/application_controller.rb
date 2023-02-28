class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    hackathons = Hackathon.all #gets all hackathons in array format so you need to convert to json
    p hackathons
    hackathons.to_json
  end

  #get single hackathon 
  get "/hackathon/:pk" do
    hackathon = Hackathon.find_by(id: params[:pk])
    hackathon.to_json
  end

  #post hackathon
  post "/hackathon/" do
    hackathon = Hackathon.create(
      image_url: params[:image_url],
      topic: params[:topic],
      description: params[:description],
      location: params[:location],
      datetime: params[:datetime] 
    )
    hackathon.save
    {
      "Message": "Created Successfully",
      "Status": "HTTP_200_OK"
    }.to_json
  end

  # Patch Hackathon
  patch "hackathon/update/:id" do 
    hackathon = Hackathon.find_by(id: params[:id])
    hackathon.update(
      image_url: params[:image_url],
      topic: params[:topic],
      description: params[:description],
      location: params[:location],
      datetime: params[:datetime] 
    )
    hackathon.to_json
  end

  #Delete a Hackathon
  delete "/hackathon/:id" do
    hackathon = Hackathon.find_by(id: params[:id])
    hackathon.destroy
    {
      "Message":"Successfully deleted a Hackathon",
      "Status":"HTTP_400"
    }
  end
end
