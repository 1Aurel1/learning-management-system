class TermsController < ApplicationController
  # ====================================================================
  # Public Functions
  # ====================================================================
  def ajax_create
    @term = Term.new(term_params)
    if @term.save
      flash.now[:message] = 'Added semester'
      flash.now[:message_category] = 'info'
      @term = Term.new
    else
      flash.now[:message] = 'I failed to add the semester'
      flash.now[:message_category] = 'error'
    end

    render_term
  end

  def ajax_update
    term = Term.find params[:term][:id]

    if term.update_attributes(term_params)
      flash.now[:message] = 'We updated semester information'
      flash.now[:message_category] = 'info'
    else
      flash.now[:message] = 'Failed to update semester information'
      flash.now[:message_category] = 'error'
    end

    render_term
  end

  def ajax_new
    render_term
  end

  def ajax_destroy
    term = Term.find params[:id]
    if term.deletable? session[:id]
      term.destroy
    else
      flash.now[:message] = 'I failed to delete the semester. The term can be deleted only when the registration course is zero.'
      flash.now[:message_category] = 'error'
    end
    render_term
  end

  # ====================================================================
  # Private Functions
  # ====================================================================

  private

  def term_params
    params.require(:term).permit(:id, :title, :start_at, :end_at)
  end

  def render_term
    @term = Term.new unless @term
    @terms = Term.all.order(start_at: :desc)
    render 'layouts/renders/main_pane', locals: { resource: 'new' }
  end
end
