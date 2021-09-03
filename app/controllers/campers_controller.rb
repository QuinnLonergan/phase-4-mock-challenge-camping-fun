class CampersController < ApplicationController
    wrap_parameters format: []
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


        def index
            campers = Camper.all
            render json: campers, include: :activities
        end

        def show
            camper = find_camper
            render json: camper
        end

        def create
            camper = Camper.create!(campers_params)
            render json: camper, status: :created
        rescue ActiveRecord::RecordInvalid => e
            render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
        end
      
      
        private
      
        def find_camper
          Camper.find(params[:id])
        end
      
        def campers_params
          params.permit(:name, :age)
        end
      
        def render_not_found_response
          render json: { error: "Camper not found" }, status: :not_found
        end

end
