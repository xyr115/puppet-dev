$total_disk_space = $facts['partitions'].reduce(0) |$total, $partition| {
  notice( "partition $partition[0] is size $partition[1]['size']" )
  $total + $partition[1]['size']
}
