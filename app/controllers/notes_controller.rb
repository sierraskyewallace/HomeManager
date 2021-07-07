class NotesController < ApplicationController

    def index 
        @notes = current_user.notes
    end

    def show 
        @note = Note.find_by_id(params[:id])
    end 

    def edit 
    end

    def create
    end

    def update
    end

    def destroy
    end

    private

    def set_notes 
    end

    def notes_params 
    end
end
