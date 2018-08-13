class LettersController < ApplicationController
    # before_action :set_letter, only: [:show, :edit, :update, :destroy]
    def index; end
    
    
    def new
        if params[:back]
            @letter = Letter.new(letter_params)
        else
            @letter = Letter.new
        end
    end
    
    def show
        @letters = Letter.all
    end
    
    
    def create
        @letter = Letter.new(letter_params)
        if @letter.save
            redirect_to letter_path(@letter),notice: "新しくツイートしました"
        else
            render 'new'
        end
    end
    
    def edit
        @letter = Letter.find(params[:id])
    end
    
    def destroy
        @letter = Letter.find(params[:id])
        @letter.destroy
        redirect_to letter_path(@letter)
    end
    
    
    def update
        @letter = Letter.find(params[:id])
        if @letter.update(letter_params)
        redirect_to letter_path(@letter)
        else
        render 'edit'
        end
    end
    
    def confirm
        @letter = Letter.new(letter_params)
        render :new if @letter.invalid?
    end
    
    private
    
    # def set_letter
    #     @letter = Letter.find(params[:id])
    # end
    
    def letter_params
        params.require(:letter).permit(:content)
    end

end
