twoD = [
  [1,2,3,4],
  [1,2,3,4],
  [1,2,3,4],
  [1,2,3,4]
]
i = 2
newAr = twoD

puts newAr[i][i+1]
newAr[i][i+1] = 6
puts newAr[i][i+1]

a = [1,2]
b = a.dup
a << 3
puts b.inspect
a = [ [1,2] ]
b = a.dup
a[0] << 3
puts b.inspect