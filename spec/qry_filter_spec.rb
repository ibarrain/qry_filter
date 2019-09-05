require "spec_helper"

describe QryFilter do

  describe ".compose" do
    before do
      @scope = [
        {id: 1, name: 'A', age: 18},
        {id: 2, name: 'B', age: 19},
        {id: 3, name: 'C', age: 21}
      ]
    end

    it "filters scope based on ID" do
      hash = {id: [1, 2]}

      result = QryFilter.compose(
        @scope,
        filter_hash: hash,
        filter_class: UserFilter,
        filter_by: [:id]
      )

      expect(result.map{|u| u[:id] }).to eq([1, 2])
    end

    it "filters scope based on Age" do
      hash = {age: [18, 21]}

      result = QryFilter.compose(
        @scope,
        filter_hash: hash,
        filter_class: UserFilter,
        filter_by: [:age]
      )

      expect(result.map{|u| u[:age] }).to eq([18, 21])
    end
  end

end