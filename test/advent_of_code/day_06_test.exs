defmodule AdventOfCode.Day06Test do
  use ExUnit.Case

  import AdventOfCode.Day06

  test "sop" do
    assert detect_start("abcd") == false
    assert detect_start("abca") == true
    assert detect_start("abcasdfsdfg") == true
    assert detect_start("abcdefghijkl") == false
  end

  test "part1" do
    result = part1("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
    assert result == 7
  end

  test "part1-1" do
    result = part1("bvwbjplbgvbhsrlpgdmjqwftvncz")
    assert result == 5
  end

  test "part1-2" do
    result = part1("nppdvjthqldpwncqszvftbrmjlhg")
    assert result == 6
  end

  test "part1-3" do
    result = part1("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
    assert result == 10
  end

  test "part1-4" do
    result = part1("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
    assert result == 11
  end

  test "part2-1" do
    result = part2("mjqjpqmgbljsphdztnvjfqwrcgsmlb")
    assert result == 19
  end


  test "part2-2" do
    result = part2("bvwbjplbgvbhsrlpgdmjqwftvncz")
    assert result == 23
  end

  test "part2-3" do
    result = part2("nppdvjthqldpwncqszvftbrmjlhg")
    assert result == 23
  end

  test "part2-4" do
    result = part2("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
    assert result == 29
  end

  test "part2-5" do
    result = part2("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
    assert result == 26
  end

end
