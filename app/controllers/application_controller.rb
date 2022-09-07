class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound, with: :not_found_resp
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_resp

    def not_found_resp
        render json: {error: "#{:not_found.model} not found"}, status: :not_found
    end

    def invalid_resp data
        render json: {errors: data.record.errors.full_messages}, status: :unprocessable_entity
    end

end
