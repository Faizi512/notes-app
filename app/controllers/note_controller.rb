class NoteController < ApplicationController
    def index
        @notes = current_user.notes
    end

    def show
    end

    def new
        @note = current_user.notes.build
        if @note.save
            redirect_to @note, notice: 'New note created!'
        else
            render :new
        end
    end

    def create
        @note = current_user.notes.build(note_params)
        if @Note.save
            redirect_to @note, notice: 'New note created!'
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @note.update(note_params)
            redirect_to @note, notice: 'Note updated!'
        else
            # render: :edit
        end
    end

    def destroy
        @note.destroy
        redirect_to note_url, notice: 'Note was deleted successfully'
    end


    private

    def set_note
        @note = Note.find(params[:id])
    end

    def note_params
        params.require(:note).permit(:title, :message)
    end
end
