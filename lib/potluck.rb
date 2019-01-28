class Potluck
  attr_reader :date, :dishes
  def initialize(date)
    @date = date
    @dishes = []
  end
  def add_dish(dish)
    @dishes << dish
  end
  def get_all_from_category(category)
    @dishes.select do |dish|
      category == dish.category
    end
  end
  def menu
    output = {}
    categories = []
    @dishes.each do |dish|
      categories << dish.category if !categories.include?(dish.category)
    end
    categories.each do |category|
      pluralized_category = (category.to_s + "s").to_sym
      output[pluralized_category] = get_all_from_category(category).map{|dish| dish.name}.sort
    end
    return output
  end
  def ratio(category)
    (100 * get_all_from_category(category).length.to_f / @dishes.length).round(1)
  end
end
