class Users::MicrodoseLogEntriesController < ApplicationController
  def index

  end

  def show
    @facade = MicrodoseLogEntryFacade.new(params).one_microdose_log_entry(params[:user_id], params[:id])
  end

  def new
    @facade = MicrodoseLogEntryFacade.new(params)
    @openai = OpenaiFacade.get_response
  end

  def create
    microdose_log_entry = MicrodoseLogEntryFacade.new(microdose_log_entry_params).new_entry
    if microdose_log_entry.is_a?(Array)
      flash[:error] = MicrodoseLogEntryFacade.format_errors(microdose_log_entry)
      redirect_to new_user_microdose_log_entry_path(params[:user_id]), params
    else
      redirect_to user_path(params[:user_id]) 
    end
  end

  private

  def microdose_log_entry_params
    params.permit(:mood_before,
                  :mood_after,
                  :environment,
                  :dosage,
                  :intensity,
                  :sociability,
                  :journal_prompt,
                  :journal_entry,
                  :other_notes,
                  :user_id)
  end
end