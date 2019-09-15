class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def manipulate(cell=1)
    cell.times do manhattan_distance!
    end
  end

  def manhattan_distance!

    manhattan_distance = []
    @image.each_with_index do |row, y|
      row.each_with_index do |x, row_y|
        manhattan_distance << [y, row_y] if x == 1
      end
    end

    manhattan_distance.each do |cell|
      @image[cell[0]    ][cell[1] + 1] = 1 if cell[1] + 1 <= @image[cell[0]].length - 1
      @image[cell[0] + 1][cell[1]    ] = 1 if cell[0] + 1 <= @image.length - 1
      @image[cell[0]    ][cell[1] - 1] = 1 if cell[1] - 1 >= 0
      @image[cell[0] - 1][cell[1]    ] = 1 if cell[0] - 1 >= 0
    end

  end

  def output_image
    @image.each { |x| puts x.join("") }
  end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 1]
])

image.manipulate(3)
image.output_image