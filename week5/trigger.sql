CREATE TRIGGER egg_filler
    AFTER INSERT ON Bird_eggs
    FOR EACH ROW
    BEGIN
        UPDATE Bird_eggs
            SET
                Egg_num = COALESCE((SELECT MAX (Egg_num) + 1 FROM Bird_eggs WHERE Nest_ID = new.Nest_ID),1),
                Book_page = (SELECT Book_page FROM Bird_nests WHERE Nest_ID = new.Nest_ID),
                Year = (SELECT Year FROM Bird_nests WHERE Nest_ID = new.Nest_ID),
                Site = (SELECT Site FROM Bird_nests WHERE Nest_ID = new.Nest_ID)
            WHERE Nest_ID = new.Nest_ID;
    END;


