class Image
  def initialize(imgAr)
    if imgAr
        @imgAr = imgAr
    end
  end

  def output_image(arg = nil)
    arLen = @imgAr.length
    @imgAr.each do |i|
      line = []
      i.each do |k|
        line << k.to_s
        end
      puts line.join
    end
  end
  
  def blur(distance)
    arLen = @imgAr.length
    newAr = Marshal.load(Marshal.dump(@imgAr))
    i = 0
    k = 0
    while i < arLen      
      while k < arLen
        h = 0
        if newAr[i][k] == 1
          # Diagonal values
          while h <= distance
            j = distance - h
            while j >= 0
              if i + j <= arLen && k + h <= arLen
                @imgAr[i + j][k + h] = 1
              end
              if i - j >= 0 && k + h <= arLen
                @imgAr[i - j][k + h] = 1
              end
              if i + j <= arLen && k - h >= 0
                @imgAr[i + j][k - h] = 1
              end
              if i - j >= 0 && k - h >= 0
                @imgAr[i - j][k - h] = 1
              end
              j -= 1
            end
            h += 1
          end
        end
        k += 1
      end
      k = 0
      i += 1
    end
    output_image(@imgAr)
  end
end

newImg = [
    [0,0,0,0,0,0,0,0,0,0,1,0],
    [0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,1,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0]
]

test = Image.new(newImg)
test.output_image
puts " "
test.blur(4)