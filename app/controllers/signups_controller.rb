class SignupsController < ApplicationController
    wrap_parameters format: []

    def create
        signup = Signup.create!(signups_params)
        render json: signup.activity, status: :created
    rescue ActiveRecord::RecordInvalid => e
        render json: {errors: e.record.errors.full_messages}, status: :unprocessable_entity
    end

    private

    def signups_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
