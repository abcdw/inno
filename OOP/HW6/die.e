note
    description: "Summary description for {DIE}."
    author: ""
    date: "$Date$"
    revision: "$Revision$"

class
    DIE

create
    make

feature {NONE}
    rand: V_RANDOM
feature
    make
        do
            create rand
        end

    roll: INTEGER

        do

            Result := rand.bounded_item (1, 6)
            rand.forth
            print ("Die value: ")
            Io.put_integer (Result)
            Io.new_line
        end

end

