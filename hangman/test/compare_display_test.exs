defmodule Compare_displayTest do

    use ExUnit.Case
        doctest Hangman
        test "return delelete compare 1" do
            assert Compare_display.delete_compare([0, 1, 2, 3], "A", "DATAB") == [1,3]
        end
        test "return delete compare 2" do
            assert Compare_display.delete_compare([1, 2, 3, 5], "N", "BATMAN") == [5]
        end
        test "return delete compare 3" do
            assert Compare_display.delete_compare([0, 3, 4, 5, 6, 7, 9], "Z", "CHRISTOPHER") == []
        end
        test "return delete compare 4" do
            assert Compare_display.delete_compare([0, 1, 2, 3, 4], "n", "NOLAN") == [0,4]
        end
        test "return delete compare 5" do
            assert Compare_display.delete_compare([0, 1, 2, 4], "p", "NOLAN") == []
        end


        test "return compare string 1 " do
            assert Compare_display.make_compare("Z", "ZOMATO", "---A-O", 6) == ["Z","-","-","A","-","O"]
        end
        test "return compare string 2 " do
            assert Compare_display.make_compare("R", "PARSER", "PARSER", 6) == ["P","A","R","S","E","R"]
        end
        test "return compare string 3 " do
            assert Compare_display.make_compare("R", "PARSER", "PA-SE-", 6) == ["P","A","R","S","E","R"]
        end
        test "return compare string 4 " do
            assert Compare_display.make_compare("r", "CODEFORCES", "COD--O-C--", 10) == ["C","O","D","-","-","O","R","C","-","-"]
        end
end