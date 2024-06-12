includes = function(arr, s)
  for _, val in ipairs(arr) do
    if s == val then
      return true
    end
  end

  return false
end
