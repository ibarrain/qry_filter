class ApplicationFilter
  attr_reader :scope

  def initialize(scope, filter_hash)
    @scope = scope
    @filter_hash = filter_hash
  end

  def default
  end
end