note
    description: "project application root class"

class
    APPLICATION

inherit

    ARGUMENTS

create
    make

feature {NONE} -- Initialization
    g: GAME
    make
        local
        do
            create g.make
            g.start
        end
end

