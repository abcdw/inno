DROP FUNCTION int_to_roman(num integer);
CREATE OR REPLACE FUNCTION int_to_roman(num integer)
RETURNS text AS
$$
BEGIN
    RETURN to_char(num, 'FMRN');
END
$$ LANGUAGE plpgsql;

DROP FUNCTION roman_to_int(roman text);
CREATE OR REPLACE FUNCTION roman_to_int(roman text)
RETURNS integer AS
$$
DECLARE
    ans integer := -1;
BEGIN
    FOR i IN 1..3999 LOOP
        IF int_to_roman(i) = roman THEN ans := i; END IF;
    END LOOP;
    RETURN ans;
END
$$ LANGUAGE plpgsql;

DROP FUNCTION r_add(num1 text, num2 text);
CREATE OR REPLACE FUNCTION r_add(num1 text, num2 text)
RETURNS text AS
$$
DECLARE
    n1 integer := roman_to_int(num1);
    n2 integer := roman_to_int(num2);
BEGIN
    RETURN int_to_roman(n1 + n2);
END
$$ LANGUAGE plpgsql;

DROP FUNCTION r_sub(num1 text, num2 text);
CREATE OR REPLACE FUNCTION r_sub(num1 text, num2 text)
RETURNS text AS
$$
DECLARE
    n1 integer := roman_to_int(num1);
    n2 integer := roman_to_int(num2);
BEGIN
    RETURN int_to_roman(n1 - n2);
END
$$ LANGUAGE plpgsql;

SELECT * FROM int_to_roman(310);
SELECT * FROM roman_to_int('CXV');
SELECT * FROM r_add('CXV', 'CX');
SELECT * FROM r_sub('CXV', 'X');
