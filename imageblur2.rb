class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def output_image
    #array_width = @image.length
    #puts @image.join('')

    manipulate(@image)

  end

end

def manipulate(image)
  iteration = -1

  # https://stackoverflow.com/questions/5335502/how-to-get-row-and-column-length-of-a-2-dimensional-array-in-rails-3
  height = image.length
  width = image[0].length

  image = image.flatten

  # https://stackoverflow.com/questions/5646710/change-value-of-array-element-which-is-being-referenced-in-a-each-loop
  image = image.map! {|number|

    iteration = iteration + 1

    if (number == 1)

      if (iteration - 1 > -1) and (iteration % width != 0)
        image[iteration - 1] = "A"
      end

      if (iteration + 1 < height * width) and (iteration % width != width - 1)
        image[iteration + 1] = "A"
      end

      if (iteration - width > -1)
        image[iteration - width] = "A"
      end

      if (iteration + width < height * width)
        image[iteration + width] = "A"
      end
        
      number = "A"
      
    else
      number
    end

  }

  image = image.map do |e|
    if e == "A"
      1

    else
      e
    end
  end

  image = image.each_slice(width).to_a
  #print image
  #puts image.inspect

  image.each { |x| puts x.join("") }
end


image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 1]
])
image.output_image