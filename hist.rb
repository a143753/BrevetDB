def make_hist s, b, t
  h = {}
  t.sort.each do |e|
    i = (e - s) / b
    if h[i] == nil then
      h[i] =  1
    else
      h[i] += 1
    end
  end
  return h
end

tbl = []
dns = 0
dnf = 0
while line = $stdin.gets do
  if /(\d+):(\d+)/.match line
    tbl.push ($1.to_i * 60) + $2.to_i
  elsif /DNS/.match line then
    dns += 1
  elsif /DNF/.match line then
    dnf += 1
  end
end

def print t, b, s
  t.keys.each do |k|
    h = (k * b + s ) / 60
    m = (k * b + s ) % 60
    printf "%02d:%02d, %d\n", h, m, t[k]
  end
end

h = make_hist 11*60, 30, tbl

print h, 30, 11*60
printf "# DNS=%d, DNF=%d\n", dns, dnf
