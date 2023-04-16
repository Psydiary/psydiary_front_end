class Users::DailyLogEntriesController < ApplicationController

  def index

  end

  def show
    
  end

  def new
    @facade = DailyLogEntriesFacade.new(params)
  end

  def create

  end
end