class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        if @cat
            render :show
        else
            render json: "No cat found", status: 404
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create
        @cat = Cat.new(cat_params)
        if @cat.save!
            redirect_to cat_url(@cat)
        else
            render json: "cannot create cat", status: 422
        end
    end

    def edit
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    def update
        @cat = Cat.find_by(id: params[:id])
        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: "failed to update", status:400
        end
    end

    private 
    def cat_params
        params.require(:cat).permit(:name,:birth_date, :sex,:color,:description)
    end
end

