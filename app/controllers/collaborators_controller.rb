class CollaboratorsController < ApplicationController


  def new
    @collaborator = Collaborator.new
    
  end

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki_id, user_id: params(:user_id))

    if @collaborator.save
      flash[:notice] = "Collaborator was added to your wiki."
      redirect_to @wiki
    else
      flash[:error] = "There was an error adding the collaborator to your wiki. Try to add them again."
      redirect_to @wiki
    end
  end

  def destroy
    @collaborator = Collaborator.find(params(:id))

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed."
      redirect_to @wiki
    else
      flash[:error] = "There was an error removing the collaborator from the wiki. Try again."
      redirect_to @wiki
    end
  end


private
  def collaborated_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
