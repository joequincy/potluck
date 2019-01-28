require 'minitest/autorun'
require 'minitest/pride'
require './lib/dish'

class DishTest < Minitest::Test
  def setup
    @dishes = [
      Dish.new("Couscous Salad", :appetizer),
      Dish.new("Chips and Dip", :appetizer),
      Dish.new("Lasagne",:entre)
    ]
  end
  def test_dish_exists
    assert_instance_of Dish, @dishes[0]
  end
  def test_dish_has_correct_attributes
    assert_equal "Couscous Salad", @dishes[0].name
    assert_equal :appetizer, @dishes[0].category
    assert_equal "Chips and Dip", @dishes[1].name
    assert_equal :appetizer, @dishes[1].category
    assert_equal "Lasagne", @dishes[2].name
    assert_equal :entre, @dishes[2].category
  end
end
