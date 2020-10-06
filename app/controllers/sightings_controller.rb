class SightingsController < ApplicationController

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting

            #below we made a custom hash that produces nested objects in our rendered json for bird and location
            #render json: { id: sighting.id, bird: sighting.bird, location: sighting.location } 

            #alternative way is to use include option to indicate what models you want to nest
            #render json: sighting, include: [:bird, :location]

            #this is how rails is obscuring .to_json
            render json: sighting.to_json(include: [:bird, :location])
        else 
            render json: { message: 'No sighting found with that id' }
        end 
    end 

    def index
        #include also works when dealing with controller action taht renders an array like when we use .all
        sighting = Sighting.all 
        render json: sightings, include: [:bird, :location]

        #this is how rails is obscuring .to_json
        #render json: sightings.to_json(include: [:bird, :location])
    end 
end
