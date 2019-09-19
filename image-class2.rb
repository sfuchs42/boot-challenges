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
  
  def blur
    arLen = @imgAr.length
    newAr = Marshal.load(Marshal.dump(@imgAr))
    puts newAr.inspect
    i = 0
    k = 0
    while i < arLen
      while k < arLen
        if newAr[i][k] == 1
          if i == 0 || i == arLen - 1
            if k == 0
              @imgAr[i][k + 1] = 1
            elsif k == arLen - 1
              @imgAr[i][k - 1] = 1
            else
              @imgAr[i][k + 1] = 1
              @imgAr[i][k - 1] = 1
            end
            if i == 0
              @imgAr[i + 1][k] = 1
            else
              @imgAr[i - 1][k] = 1
            end
          elsif k == 0 || k == arLen - 1
            if i == 0
              @imgAr[i + 1][k] = 1
            elsif i == arLen - 1
              @imgAr[i - 1][k] = 1
            else
              @imgAr[i + 1][k] = 1
              @imgAr[i - 1][k] = 1
            end
            if k == 0
              @imgAr[i][k + 1] = 1
            else
              @imgAr[i][k - 1] = 1
            end
          else
            @imgAr[i + 1][k] = 1
            @imgAr[i - 1][k] = 1
            @imgAr[i][k - 1] = 1
            @imgAr[i][k + 1] = 1
          end
        end
        puts newAr.inspect
        puts @imgAr[i][k]
        k += 1
      end
      k = 0
      i += 1
    end
    output_image(@imgAr)
  end



end

newImg = [
    [1,0,0,0,0,0,0,0,0,0,0,0],
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
test.blur
