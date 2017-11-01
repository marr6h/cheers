class EntriesController < ApplicationController
    def create
        @entry = Entry.new(entry_params)
        @entry.entry_from = current_user.id
        status = false
        if @entry.save
            status = true
        end
        respond_to do |format|
            format.json {render json: {'status' => status}}
            format.any
        end
    end

    private
        def entry_params
            params.require(:entry).permit(:post_id)
        end
end
