class Array
  def sum
    return self.inject(0){|acc,i|acc +i}
  end

  def average
    return self.sum/self.length.to_f
  end

  def sample_variance
    avg=self.average
    sum=self.inject(0){|acc,i|acc +(i-avg)**2}
    return(1/self.length.to_f*sum)
  end

  def standard_deviation
    return 0 if self.empty?
    return Math.sqrt(self.sample_variance)
  end
  
  def counts
    self.inject(Hash.new(0)) do |hash,element|
      hash[element] += 1
      hash
    end
  end
  
	def percentile(percentile=0.0)
	  if percentile == 0.0
	    return self.sort.first
    else
      classes = self.collect(&:class).uniq
      if ([Hash, Array]-classes==[Hash, Array]) && classes.length == 1
        return self ? self.sort[((self.length * percentile).ceil)-1] : nil rescue nil
      else
        return self[((self.length * percentile).ceil)-1]
      end
    end
  end

	def reverse_percentile(value=0.0)
    index_value = nil
    self.collect(&:to_f).sort.each do |val|
      index_value = val;break if value <= val
    end
    return (self.index(index_value)/self.length.to_f)
  end
end
