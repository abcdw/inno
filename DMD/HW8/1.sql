DROP FUNCTION print_text();
CREATE OR REPLACE FUNCTION print_text()
RETURNS text AS
$$
DECLARE
    ret text  := '';
    conc text := '';
BEGIN
    FOR i IN 1..100 LOOP
        conc := '';
        IF i % 3 = 0  THEN conc := conc || 'Fizz'; END IF;
        IF i % 5 = 0  THEN conc := conc || 'Buzz'; END IF;
        IF conc = '' THEN conc := conc || i; END IF;
        ret := ret || conc || E'\n';
    END LOOP;
    RETURN ret;
END
$$ LANGUAGE plpgsql;

SELECT * FROM print_text();

