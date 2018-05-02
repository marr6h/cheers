class EntriesController < ApplicationController
    def create
        entry = Entry.new(entry_params)
        if Entry.exists?(:post_id => entry.post_id, :entry_from => current_user.id)
          status = false
        else
          entry.entry_from = current_user.id
          entry.cheer = 0
          status = false
          if entry.save
              status = true
          end
        end
        respond_to do |format|
            format.json {render json: {'status' => status, 'errors' => entry.errors.messages}}
            format.any
        end
    end

    def update
        params = entry_params
        entry = Entry.where(id: params[:id]).first
        status = false
        if !entry.nil? && entry.update(entry_to: params[:entry_to], cheer: 1)
            status = true
        end
        respond_to do |format|
            format.json {render json: {'status' => status, 'errors' => entry.errors.messages}}
        end
    end

    private
        def entry_params
            params.require(:entry).permit(:id, :post_id, :entry_to)
        end

end
