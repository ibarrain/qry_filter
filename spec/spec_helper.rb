require "qry_filter"
require 'active_record'

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

load File.dirname(__FILE__) + '/schema.rb'
require File.dirname(__FILE__) + '/models.rb'

class UserFilter
  attr_reader :scope

  def initialize(scope, filter_hash)
    @scope = scope
    @filter_hash = filter_hash
  end

  def default
    by_id
    by_age
  end

  def by_id
    @scope = @scope.where(id: @filter_hash[:id])
  end

  def by_age
    @scope = @scope.where(age: @filter_hash[:age])
  end
end

class Controller
  include QryFilter
end