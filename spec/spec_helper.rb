require "qry_filter"

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
    @scope = @scope.select{|u| @filter_hash[:id].include?(u[:id])}
  end

  def by_age
    @scope = @scope.select{|u| @filter_hash[:age].include?(u[:age])}
  end
end