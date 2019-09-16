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
end

newImg = [
    [0,0,0,1],
    [0,1,0,1],
    [0,1,1,1],
    [1,0,0,0]
]

test = Image.new(newImg)
test.output_image
