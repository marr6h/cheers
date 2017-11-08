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

    def update
        params = entry_params
        @entry = Entry.where(id: params[:id]).first
        status = false
        if !@entry.nil? && @entry.update(entry_to: params[:entry_to])
            status = true
        end
        respond_to do |format|
            format.json {render json: {'status' => status}}
        end
    end

    private
        def entry_params
            params.require(:entry).permit(:id, :post_id, :entry_to)
        end

end
