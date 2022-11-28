class InstructorsController < ApplicationController
    # rescue method for invalid requests
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    # rescue method for invalid posts
    rescue_from ActiveRecord::RecordInvalid, with: :render_ivalid_entity
    def index
        instructors = Instructor.all 
        render json: instructors
    end
    def show
        instructor = Instructor.find(params[:id])
        render json: instructor
    end

    def update
        instructor = Instructor.create!(name: params[:name]) 
        render json: instructor
    end

    def destroy
        instructors = Instructor.find(params[:id])
        instructor.destroy
    end

    private
    def render_not_found
        render json: {error: 'Instructor not found'}, status: :not_found
    end

    def render_ivalid_entity
        render json: {error: 'Invalid parameters'}, status: :unprossable_entity
    end

end
