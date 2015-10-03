note
    description: "Summary description for {PLAYER}."
    author: ""
    date: "$Date$"
    revision: "$Revision$"

class
    PLAYER
create
    make
feature
    name: STRING
    g: GAME
    position: INTEGER

    make(ga: GAME)
    do
        g := ga
        position := 1
        print ("Input player name:%N")
        Io.read_line
        create name.make_from_string (Io.last_string)

    end

    do_turn
    local
        d1: INTEGER
        d2: INTEGER
    do
        d1 := g.dice.roll
        d2 := g.dice.roll

        if d1 = d2 then
            if d1 < position then
                position := position - d1
            else
                position := 1
            end
        else
            position := position + d1 + d2
            if position > g.field_length then
                position := g.field_length
            end
        end
        print (name)
        print (" position is ")
        print (position)
        Io.new_line
    end

    got_end: BOOLEAN
    do
        Result := position >= g.field_length
    end

invariant
    in_field: 1 <= position
end

