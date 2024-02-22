class StudentsController < ApplicationController
    def index
        @students=Student.all
    end
    def new
        @student=Student.new
    end
    def create
        @student=Student.new(name: params[:student][:name],email: params[:student][:email],address_id: params[:student][:address_id])
        if @student.save
            redirect_to "/address#index"
        end
    end
    def edit
        @student=Student.find(params[:id])
    end
    def update
        @student=Student.find(params[:id])
        if @student.update(name: params[:student][:name],email: params[:student][:email],address_id: params[:student][:address_id])
            redirect_to "/address#index"
        end
    end
    def destroy
        @student=Student.find(params[:id])
        if @student.destroy
            redirect_to "/address#index"
        end
    end
end
