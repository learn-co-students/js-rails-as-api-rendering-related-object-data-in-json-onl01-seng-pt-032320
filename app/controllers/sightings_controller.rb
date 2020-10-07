class SightingsController < ApplicationController

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting
            render json: sighting.to_json(:include => {
                :bird => {:only => [:name, :species]},
                :location => {:only => [:latitude, :longitude]}
            }, :except => [:updated_at])
            # render json: sighting, include: [:bird, :location], except: [:updated_at]
            # render json: sighting.to_json(include: [:bird, :location])
          else
            render json: { message: 'No sighting found with that id' }
          end
        # render json: sighting.to_json(include: [:bird, :location])
        # render json: sighting, include: [:bird, :location]
      end

      def index
        sightings = Sighting.all
        render json: sightings.to_json(include: [:bird, :location])
        # render json: sightings, include: [:bird, :location]
      end
end
