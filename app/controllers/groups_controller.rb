class GroupsController < ApplicationController

    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
    end


    def create
        @group = Group.create(set_group)
        redirect_to group_path(@group.id)
    end
    
    
    def show
        @group = Group.find(params[:id])
    end 
    
    def edit
        @group = Group.find(params[:id])
    end


    def update
        @group = Group.find(params[:id])
        @group.update(set_group)

        redirect_to @group
    end

    def destroy
        @group = Group.find(params[:id])
        @group.destroy

        redirect_to groups_path
    end

   private

    def set_group
        params.require(:group).permit(:name)
        
    end

end
