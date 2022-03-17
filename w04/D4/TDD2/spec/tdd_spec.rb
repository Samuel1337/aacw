require "tdd.rb"
require "rspec"

describe Array do 
  describe "#my_uniq" do
    arr = [1,1,1,2,2,3]
    it "returns an array with only uniq elements"  do
      expect(arr.my_uniq).to eq([1,2,3])
    end
  end

  describe "#two_sum" do
    arr = [-1, 0, 2, -2, 1]
    it "returns pairs of positions which sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to include([0, 4], [2, 3])
    end

    it "returns the indecies in dictionary order" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    it "returns a transposed array, duh" do
      arr = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
      expect(arr.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe "#stock_picker" do
    stock = [100,2,3,7,102, 1]

    it "returns an array of length 2" do
      expect(stock.stock_picker.count).to be(2)
    end

    it "includes the days on which to buy and sell" do
      expect(stock.stock_picker).to eq([1,4])
    end
  end

end