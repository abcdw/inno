note
    description: "Summary description for {GAME}."
    author: ""
    date: "$Date$"
    revision: "$Revision$"

class
    GAME

create
    make

feature

    players: ARRAY [PLAYER]

    dice: DIE

    n: INTEGER

    finished: BOOLEAN

    field_length: INTEGER

    make
        local
            i: INTEGER
        do
            create dice.make

            finished := False
            field_length := 40
            create players.make_empty

            print ("Input player count:%N")
            Io.read_integer
            n := Io.last_integer

            from
                i := 0
            variant
                n - i
            until
                i = n
            loop
                players.force(create {PLAYER}.make (Current), i)
                i := i + 1
            end

        end

    start
        local
            i: INTEGER
            p: PLAYER
        do
            from
                i := 0
            until
                finished
            loop
                i := (i + 1) \\ n
                print (i)
                Io.new_line
                p := players[i]
                p.do_turn
                if p.got_end then
                    print (p.name)
                    print (" won%N")
                    finished := True
                end
            end
        end

end

