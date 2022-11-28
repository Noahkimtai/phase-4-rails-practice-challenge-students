class StudentsController < ApplicationController
    # rescue for invalid requests
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    # rescue for invalid posts
    rescue_from ActiveRecord::RecordInvalid, with: :render_ivalid_entity
    def index
        students = Student.all 
        render json: students
    end
    def show
        student = Student.find(params[:id])
        render json: student
    end

    def update
        student = Student.create!(name: params[:name], major: params[:major],
        age: params[:age]) 
        render json: student
    end

    def destroy
        student = Student.find(params[:id])
        student.destroy
    end

    private
    def render_not_found
        render json: {error: "Student not found"}, status: :not_found
    end

    def render_ivalid_entity
        render json: {error: "Invalid entity"}, status: :unprossable_entity
    end
end
