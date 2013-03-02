class AdminController < ApplicationController
  respond_to :html

  def index
    @objects = object_class.all
  end

  def new
    @object = object_class.new
  end

  def create
    @object = object_class.new object_params
    @object.save
    respond_with @object
  end

  def show
    @object = object_class.find params[:id]
  end

  def edit
    @object = object_class.find params[:id]
  end

  def update
    @object = object_class.find params[:id]
    @object.update_attributes object_params
    respond_with @object
  end

  def destroy
    @object = object_class.find params[:id]
    @object.destroy
    respond_with @object
  end

  protected

  def object_class
    controller_name.singularize.camelize.constantize
  end
end
